import 'dart:io';

import 'package:picco/customer/models/user_model.dart';
import 'package:picco/customer/view/login/sign_up/sign_up_local_widgets/pick_image.dart';
import 'package:picco/customer/view/login/sign_up/sign_up_local_widgets/sign_up_phone_pincode.dart';
import 'package:picco/customer/view/widgets/widget_utils.dart';
import 'package:picco/services/hive_service.dart';
import 'package:picco/services/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class SignUpFullNamePage extends StatefulWidget {
  const SignUpFullNamePage({Key? key}) : super(key: key);

  @override
  State<SignUpFullNamePage> createState() => _SignUpFullNamePageState();
}

class _SignUpFullNamePageState extends State<SignUpFullNamePage> {
  bool scroll = false;
  bool errorConfirmPassword = false;
  File? image;
  final picker = ImagePicker();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  ScrollController scrollController = ScrollController();

  textFieldHintText(int index) {
    switch (index) {
      case 0:
        return LocalizationKey.str_full_name.tr(context);
      case 1:
        return LocalizationKey.str_password.tr(context);
      case 2:
        return LocalizationKey.str_confirm_password.tr(context);
    }
  }

  textFieldCheck(phoneNumber) {
    if (confirmPasswordController.text.trim() !=
        passwordController.text.trim()) {
      setState(() {
        errorConfirmPassword = true;
      });
      return;
    }
    setState(() {
      errorConfirmPassword = false;
    });
    UserModel user = UserModel(
      fullName: fullNameController.text,
      password: passwordController.text,
      phoneNumber: phoneNumber,
      role: "user",
    );
    HiveService.box.put("user", user.toJson());
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    String phoneNumber = ModalRoute.of(context)!.settings.arguments as String;
    List<TextEditingController> controllers = <TextEditingController>[
      fullNameController,
      passwordController,
      confirmPasswordController,
    ];
    return WillPopScope(
      onWillPop: () async {
        if (scroll) {
          setState(() {
            scroll = false;
            scrollController.position.animateTo(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          controller: scrollController,
          physics: scroll
              ? const ScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 50.h),
                WidgetUtils.logo(height: 54, width: 176),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: pickImage(),
                ),
                for (int i = 0; i < controllers.length; i++)
                  textFieldBox(i, controllers[i]),
                SignUpButton(function: () {
                  textFieldCheck(phoneNumber);
                }),
                SizedBox(
                  height: 0.22.sh,
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: SwitchLoginText(index: 0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  textFieldBox(index, controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        onTap: () {
          setState(() {
            scroll = true;
          });
        },
        onSubmitted: (value) {
          setState(() {
            scroll = false;
            scrollController.position.animateTo(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          });
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: controller == confirmPasswordController &&
                      errorConfirmPassword
                  ? Colors.red
                  : Colors.grey,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          errorText:
              controller == confirmPasswordController && errorConfirmPassword
                  ? "Error confirm password"
                  : null,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          hintText: textFieldHintText(index),
          hintStyle: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
