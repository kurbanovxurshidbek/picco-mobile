import 'package:picco/services/localization_service.dart';
import 'package:picco/customer/view/widgets/widget_utils.dart';
import 'package:flutter/material.dart';

class SignUpNumberOrPinCode extends StatefulWidget {
  final String mainText;
  final String descriptionText;
  final Widget widget;
  final Function() onPress;

  const SignUpNumberOrPinCode({
    Key? key,
    required this.mainText,
    required this.descriptionText,
    required this.widget,
    required this.onPress,
  }) : super(key: key);

  @override
  State<SignUpNumberOrPinCode> createState() => _SignUpNumberOrPinCodeState();
}

class _SignUpNumberOrPinCodeState extends State<SignUpNumberOrPinCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(width: double.infinity, height: 60),
          WidgetUtils.logo(height: 54, width: 176),
          const SizedBox(height: 120),
          Text(
            widget.mainText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 15),
          Text(
            widget.descriptionText,
            style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 25),
            child: widget.widget,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                onPressed: widget.onPress,
                color: const Color.fromRGBO(113, 105, 249, 1),
                child: Text(
                  LocalizationKey.str_done.tr(context),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  final Function() function;

  const SignUpButton({Key? key, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: const Color.fromRGBO(113, 105, 249, 1),
        textColor: Colors.white,
        onPressed: function,
        child: Text(LocalizationKey.str_sign_up.tr(context)),
      ),
    );
  }
}
