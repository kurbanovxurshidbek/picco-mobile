import 'package:picco/seller/views/pages/announcement/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NextBackButtons extends StatelessWidget {
  AnimationController controller;
  NextBackButtons({Key? key, required this.controller}) : super(key: key);

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            child: const Text(
              'Назад',
              style: TextStyle(fontSize: 18),
            ),
            color: Colors.transparent,
            elevation: 0.0,
            onPressed: () {
              if (provider.headers[provider.currentPageIndex].isNotEmpty) {
                controller
                  ..repeat(reverse: false)
                  ..forward();
              }
              provider.pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
          ),
          MaterialButton(
            child: Text(
              provider.currentPageIndex == 11 ? 'Сохранить обявление' : 'Далее',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            color: const Color(0xff7842D0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: () {
              if (provider.headers[provider.currentPageIndex].isNotEmpty) {
                controller
                  ..repeat(reverse: false)
                  ..forward();
              }
              provider.currentPageIndex == 11
                  ? Navigator.pop(context)
                  : provider.pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
            },
          ),
        ],
      ),
    );
  }
}
