import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:picco/customer/view/login/sign_up/sign_up_fullName_page.dart';
import 'package:picco/customer/view/login/sign_up/sign_up_pin_code_page.dart';

class SignupPhoneNumberPageController extends ChangeNotifier {
  bool isLoading = false;

  var maskPhoneNumber = MaskTextInputFormatter(
    mask: '+998 ## ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final FirebaseAuth auth = FirebaseAuth.instance;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController controllerPhoneNumber =
      TextEditingController(text: "+998");
  TextEditingController otpController = TextEditingController();
  String? verificationId;

  sendSMS(context) async {
    isLoading = true;
    notifyListeners();
    await auth.verifyPhoneNumber(
      phoneNumber: controllerPhoneNumber.text,
      verificationCompleted: (phoneAuthCredential) async {
        isLoading = false;
        notifyListeners();
      },
      //if wrong info
      verificationFailed: (verificationFailed) async {
        isLoading = false;
        notifyListeners();
        _scaffoldKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(verificationFailed.message!),
          ),
        );
      },
      //resent code
      codeSent: (verificationId, resendingToken) async {
        isLoading = false;
        //for check and update
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
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential, context) async {
    isLoading = true;
    notifyListeners();

    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);

      isLoading = false;
      notifyListeners();

      if (authCredential.user != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => const SignUpFullNamePage()));
      }
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      notifyListeners();
      _scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(e.message!),
        ),
      );
    }
  }

  commitSMS(context) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: otpController.text);
    //to sign in to firebase
    signInWithPhoneAuthCredential(phoneAuthCredential, context);
  }
}
