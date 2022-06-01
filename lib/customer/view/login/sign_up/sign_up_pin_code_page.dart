import 'package:picco/services/localization_service.dart';
import 'package:picco/customer/view/login/sign_up/sign_up_local_widgets/sign_up_phone_pincode.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'sign_up_fullName_page.dart';

class SignUpPinCodePage extends StatefulWidget {
  const SignUpPinCodePage({Key? key}) : super(key: key);

  @override
  State<SignUpPinCodePage> createState() => _SignUpPinCodePageState();
}

class _SignUpPinCodePageState extends State<SignUpPinCodePage> {
  late String currentText;

  @override
  Widget build(BuildContext context) {
    String phoneNumber = ModalRoute.of(context)!.settings.arguments as String;
    return SignUpNumberOrPinCode(
      mainText: LocalizationKey.str_your_code.tr(context),
      descriptionText:
          LocalizationKey.str_sent_sms.tr(context) + " $phoneNumber ",
      widget: PinCodeTextField(
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
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpFullNamePage(),
            settings: RouteSettings(arguments: phoneNumber),
          ),
        );
      },
    );
  }
}
