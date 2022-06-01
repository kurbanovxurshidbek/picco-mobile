import 'package:flutter/material.dart';
import 'package:picco/seller/views/pages/announcement/provider.dart';
import 'package:provider/provider.dart';

class NextBackButtons extends StatelessWidget {
  AnimationController controller;

  NextBackButtons({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final watchProvider = context.watch<AnnouncementProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
              style: TextStyle(fontSize: 15),
            ),
            color: Colors.transparent,
            elevation: 0.0,
            onPressed: () {
              if (watchProvider
                  .headers[watchProvider.currentPageIndex].isNotEmpty) {
                controller
                  ..repeat(reverse: false)
                  ..forward();
              }
              watchProvider.pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
          ),
          MaterialButton(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              watchProvider.currentPageIndex == 9
                  ? 'Сохранить обявление'
                  : 'Далее',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            color:
                watchProvider.currentPageIndex == 3 && watchProvider.isDisabled
                    ? Colors.grey.shade300
                    : const Color(0xff7842D0),
            textColor:
                watchProvider.currentPageIndex == 3 && watchProvider.isDisabled
                    ? Colors.black45
                    : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: () {
              if (watchProvider.currentPageIndex == 3 &&
                  watchProvider.isDisabled) {
                null;
              } else {
                if (watchProvider
                    .headers[watchProvider.currentPageIndex].isNotEmpty) {
                  controller
                    ..repeat(reverse: false)
                    ..forward();
                }
                watchProvider.currentPageIndex == 9
                    ? Navigator.pop(context)
                    : watchProvider.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
              }
            },
          ),
        ],
      ),
    );
  }
}
