import 'package:picco/services/localization_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserManagementPage extends StatelessWidget {
  UserManagementPage({Key? key}) : super(key: key);

  List Function(BuildContext) labelTexts = (BuildContext context) => [
    LocalizationKey.str_full_name.tr(context),
    LocalizationKey.str_phone_number.tr(context),
    LocalizationKey.str_password.tr(context),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  CupertinoIcons.person,
                  size: 25,
                ),
                const SizedBox(width: 20),
                Text(
                  LocalizationKey.str_user_management.tr(context),
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 70),
            Column(
              children: [
                for (int i = 0; i < 3; i++)
                  Column(
                    children: [
                      textFieldManage(labelTexts(context)[i]),
                      const SizedBox(height: 20),
                    ],
                  )
              ],
            ),
            // const Spacer(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(
                    color: Colors.white,
                    text: LocalizationKey.str_clear.tr(context),
                    textColor: Colors.black),
                button(
                    color: const Color(0xff4F4E9A),
                    text: LocalizationKey.str_done.tr(context),
                    textColor: Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }

  textFieldManage(text) {
    return TextField(
      obscureText: false,
      decoration: InputDecoration(label: Text(text)),
    );
  }

  MaterialButton button({color, text, textColor}) {
    return MaterialButton(
      elevation: 0,
      color: color,
      textColor: textColor,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      onPressed: () {},
      child: Text(text),
    );
  }
}
