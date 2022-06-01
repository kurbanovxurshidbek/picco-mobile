import 'package:picco/services/hive_service.dart';
import 'package:flutter/material.dart';

import 'logged_view.dart';
import 'unlogged_view.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late bool isHaveUser;

  checkUser() {
    setState(() {
      if (HiveService.box.get("user") != null) {
        isHaveUser = true;
        return;
      }
      isHaveUser = false;
    });
  }

  @override
  void initState() {
    checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isHaveUser ? const LoggedView() :  UnLoggedView();
  }
}
