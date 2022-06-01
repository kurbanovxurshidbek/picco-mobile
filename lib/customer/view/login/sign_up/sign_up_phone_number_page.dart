
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:picco/customer/view/login/sign_up/sign_up_local_widgets/sign_up_phone_pincode.dart';
import 'package:picco/customer/viewmodel/providers/sign_up_phone_number_page_controller.dart';
import 'package:picco/services/localization_service.dart';
import 'package:provider/provider.dart';

class SignUpPhoneNumberPage extends StatefulWidget {
  const SignUpPhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<SignUpPhoneNumberPage> createState() => _SignUpPhoneNumberPageState();
}

class _SignUpPhoneNumberPageState extends State<SignUpPhoneNumberPage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SignupPhoneNumberPageController(),
      builder: (context, child) => _buildPage(context),
    );
  }

  var maskPhoneNumber = MaskTextInputFormatter(
    mask: '+998 ## ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  Widget _buildPage(BuildContext context) {
    final provider = context.watch<SignupPhoneNumberPageController>();
    return SignUpNumberOrPinCode(
      mainText: LocalizationKey.str_your_phone_number.tr(context),
      descriptionText: LocalizationKey.str_enter_phone_number.tr(context),
      widget: TextField(
        controller: provider.controllerPhoneNumber,
        inputFormatters: [maskPhoneNumber],
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      onPress: () => provider.sendSMS(context)
    );
  }
}
