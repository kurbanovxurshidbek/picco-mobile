import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static bool emailValidate(String email) {
    return RegExp(
            r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
        .hasMatch(email);
  }

  static bool passwordValidate(String password) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password);
  }

  static fireSnackBar(
      {required String normalText,
      required String redText,
      required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey.shade400.withOpacity(0.9),
        content: RichText(
          text: const TextSpan(
            text: 'Please choose ',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'Sell Type',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        duration: const Duration(milliseconds: 2500),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        shape: const StadiumBorder(),
      ),
    );
  }

  static String getMonthDayYear(String date) {
    final DateTime now = DateTime.parse(date);
    final String formatted = DateFormat.yMMMMd().format(now);
    return formatted;
  }

  static String currentDate() {
    DateTime now = DateTime.now();

    String convertedDateTime =
        '${now.year.toString()}-${now.month.toString().padLeft(2, '0')}'
        '-'
        '${now.day.toString().padLeft(2, '0')} ${now.hour.toString()}:${now.minute.toString()}';
    return convertedDateTime;
  }

  static Future<bool> dialogCommon(
      BuildContext context, String title, String message, bool isSingle) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              if (!isSingle)
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              TextButton(
                child: const Text("Confirm"),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              )
            ],
          );
        } else {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              if (!isSingle)
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              TextButton(
                child: const Text("Confirm"),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              )
            ],
          );
        }
      },
    );
  }
}
