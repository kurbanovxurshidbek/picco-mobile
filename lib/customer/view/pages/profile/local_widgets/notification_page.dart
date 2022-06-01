import 'package:picco/services/localization_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 24,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Row(
            children: [
              SizedBox(width: 0.05.sw),
              const Icon(
                CupertinoIcons.bell,
                size: 25,
              ),
              const SizedBox(width: 20),
              Text(
                LocalizationKey.str_notifications.tr(context),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          // ListView.separated(
          //   shrinkWrap: true,
          //   itemBuilder: (context, index) => notificationBox(),
          //   separatorBuilder: (BuildContext context, int index) =>
          //       const SizedBox(),
          //   itemCount: 6,
          // ),
        ],
      ),
    );
  }

  notificationBox() {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 37, right: 37, bottom: 35),
        decoration: const BoxDecoration(color: Color(0xffF1F0F0)),
        child: const Text(
          "feffff\nefefefeefef\nfdfeff",
          style: TextStyle(fontSize: 15),
        ));
  }
}
