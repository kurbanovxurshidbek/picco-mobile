import 'package:picco/services/localization_service.dart';
import 'package:picco/customer/view/login/sign_in_page.dart';
import 'package:picco/customer/view/login/sign_up/sign_up_fullName_page.dart';
import 'package:flutter/material.dart';

class WidgetUtils {
  static Logo Function({required double height, required double width}) logo =
      ({required double height, required double width}) => Logo(
            height: height,
            width: width,
          );
  static Header Function(String) header = (String text) => Header(text: text);
  static SwitchLoginText Function(int) switchLoginText =
      (int index) => SwitchLoginText(index: index);
}

class Logo extends StatelessWidget {
  final double height;
  final double width;
  const Logo({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo/picco.png',
      height: height, // 54
      width: width, // 176
    );
  }
}

class Header extends StatelessWidget {
  final String text;
  const Header({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
    );
  }
}

class SwitchLoginText extends StatelessWidget {
  final int index;

  const SwitchLoginText({Key? key, required this.index}) : super(key: key);

  checkSwitch(BuildContext context) {
    switch (index) {
      case 0:
        return [
          LocalizationKey.str_already_have_an_account.tr(context),
          LocalizationKey.str_sign_in.tr(context),
          const SignInPage(),
        ];
      case 1:
        return [
          LocalizationKey.str_dont_have_an_account.tr(context),
          LocalizationKey.str_sign_up.tr(context),
          const SignUpFullNamePage()
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    checkSwitch(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          checkSwitch(context)[0],
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => checkSwitch(context)[2]),
            );
          },
          child: Text(
            checkSwitch(context)[1],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
