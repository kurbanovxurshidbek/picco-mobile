import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:picco/customer/view/login/sign_up/sign_up_fullName_page.dart';
import 'package:picco/customer/view/login/sign_up/sign_up_pin_code_page.dart';
import 'package:picco/services/log_service.dart';

class SignupPhoneNumberPageController extends ChangeNotifier {
  bool isLoading = false;

  var maskPhoneNumber = MaskTextInputFormatter(
    mask: '+998 ## ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final auth = FirebaseAuth.instance;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final controllerPhoneNumber = TextEditingController(text: "+998");
  final otpController = TextEditingController();
  String verificationId = "";
  User? user;

  sendSMS(context) async {
    isLoading = true;
    notifyListeners();
    await auth.verifyPhoneNumber(
      phoneNumber: controllerPhoneNumber.text,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        isLoading = false;
        notifyListeners();
        Log.d(phoneAuthCredential.toString());
      },
      //if wrong info
      verificationFailed: (FirebaseAuthException e) async {
        isLoading = false;
        notifyListeners();
        _scaffoldKey.currentState?.showSnackBar(
          SnackBar(content: Text("$e")),
        );
        Log.d(e.toString());
      },
      //resent code
      codeSent: (String verificationId, resendingToken) async {
        Log.d(verificationId);
        isLoading = false;
        this.verificationId = verificationId;
        notifyListeners();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpPinCodePage(),
            settings: RouteSettings(arguments: controllerPhoneNumber.text),
          ),
        );
      },
      //for time out
      codeAutoRetrievalTimeout: (String verificationId) async {
        Log.d("codeAutoRetrievalTimeout");
      },
    );
  }

  commitSMS(context) async {
    var credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpController.text);
    await auth.signInWithCredential(credential).then((value) {
      user = FirebaseAuth.instance.currentUser;
      notifyListeners();
    }).whenComplete(() {
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpFullNamePage(),
          ),
        );
      } else {
        return;
      }
    });
  }
}
