import 'package:picco/seller/views/pages/announcement/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartButton extends StatelessWidget {
  AnimationController controller;
  StartButton({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
    context.select((AnnouncementProvider provider) => provider);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
      child: MaterialButton(
        height: 50,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text(
          'Старт',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: const Color(0xff7842D0),
        onPressed: () {
          if (provider.headers[provider.currentPageIndex].isNotEmpty) {
            controller
              ..repeat(reverse: false)
              ..forward();
          }
          provider.pageController.nextPage(
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        },
      ),
    );
  }
}