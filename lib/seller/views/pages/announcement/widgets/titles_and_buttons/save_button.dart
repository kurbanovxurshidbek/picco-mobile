import 'package:picco/seller/views/pages/announcement/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaveButton extends StatelessWidget {
  AnimationController controller;
  SaveButton({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
    context.select((AnnouncementProvider provider) => provider);
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 2.0, color: Color(0xff7842D0)),
        ),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: provider.isDisabled
            ? Colors.grey.shade300
            : const Color(0xff4f4e9a),
        splashColor: provider.isDisabled ? Colors.transparent : Colors.white54,
        textColor: provider.isDisabled ? Colors.black45 : Colors.white,
        child: const Text(
          'Сохранить',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          if (provider.headers[provider.currentPageIndex].isNotEmpty) {
            controller
              ..repeat(reverse: false)
              ..forward();
          }
          provider.isDisabled
              ? null
              : provider.pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}