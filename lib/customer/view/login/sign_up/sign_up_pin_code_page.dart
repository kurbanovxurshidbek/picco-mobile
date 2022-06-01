import 'package:firebase_auth/firebase_auth.dart';
import 'package:picco/customer/viewmodel/providers/sign_up_phone_number_page_controller.dart';
import 'package:picco/services/localization_service.dart';
import 'package:picco/customer/view/login/sign_up/sign_up_local_widgets/sign_up_phone_pincode.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class SignUpPinCodePage extends StatefulWidget {
  const SignUpPinCodePage({Key? key}) : super(key: key);

  @override
  State<SignUpPinCodePage> createState() => _SignUpPinCodePageState();
}

class _SignUpPinCodePageState extends State<SignUpPinCodePage> {
  late String currentText;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SignupPhoneNumberPageController(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    String phoneNumber = ModalRoute.of(context)!.settings.arguments as String;
    final provider = context.watch<SignupPhoneNumberPageController>();
    return SignUpNumberOrPinCode(
      mainText: LocalizationKey.str_your_code.tr(context),
      descriptionText: LocalizationKey.str_sent_sms.tr(context) + " $phoneNumber ",
      widget: PinCodeTextField(
        controller: provider.otpController,
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        animationDuration: const Duration(milliseconds: 300),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            currentText = value;
          });
        },
        appContext: context,
      ),
      onPress: () => provider.commitSMS(PhoneAuthCredential ,context),
    );
  }
}
