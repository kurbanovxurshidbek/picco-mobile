import 'package:picco/services/localization_service.dart';
import 'package:picco/customer/view/login/sign_up/sign_up_local_widgets/sign_up_phone_pincode.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'sign_up_pin_code_page.dart';

class SignUpPhoneNumberPage extends StatefulWidget {
  const SignUpPhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<SignUpPhoneNumberPage> createState() => _SignUpPhoneNumberPageState();
}

class _SignUpPhoneNumberPageState extends State<SignUpPhoneNumberPage> {
  var maskPhoneNumber = MaskTextInputFormatter(
    mask: '+998 ## ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  TextEditingController controllerPhoneNumber =
      TextEditingController(text: "+998");

  @override
  Widget build(BuildContext context) {
    return SignUpNumberOrPinCode(
      mainText: LocalizationKey.str_your_phone_number.tr(context),
      descriptionText: LocalizationKey.str_enter_phone_number.tr(context),
      widget: TextField(
        controller: controllerPhoneNumber,
        inputFormatters: [maskPhoneNumber],
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpPinCodePage(),
            settings: RouteSettings(arguments: controllerPhoneNumber.text),
          ),
        );
      },
    );
  }
}
