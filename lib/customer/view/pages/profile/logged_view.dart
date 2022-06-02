import 'package:picco/models/all_models.dart';
import 'package:picco/models/user_model.dart';
import 'package:picco/services/hive_service.dart';
import 'package:flutter/material.dart';

import 'local_widgets/profile_main_elements.dart';

class LoggedView extends StatefulWidget {
  const LoggedView({Key? key}) : super(key: key);

  @override
  State<LoggedView> createState() => _LoggedViewState();
}

class _LoggedViewState extends State<LoggedView> {
  late UserModel user;

  getUser() {
    setState(() {
      user = UserModel.fromJson(HiveService.box.get("user"));
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const CircleAvatar(
                radius: 51,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              //Name/number
              Column(
                children: [
                  Text(
                    "Jasco",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "phone number",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xff848484),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              //All settings
              for (int i = 0; i < 5; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      ProfileMainElement(
                          element: ProfileModel.elements(context)[i]),
                      i == 2
                          ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Divider(
                                color: Color.fromRGBO(132, 132, 132, 1),
                              ))
                          : const SizedBox(height: 10),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
