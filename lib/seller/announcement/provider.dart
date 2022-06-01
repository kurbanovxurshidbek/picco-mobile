import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnnouncementProvider extends ChangeNotifier {
  PageController pageController = PageController();

  TextEditingController addressController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  FocusNode addressFocus = FocusNode();
  FocusNode titleFocus = FocusNode();

  bool isExpanded = false;
  bool isScrolledUp = false;
  bool isDisabled = true;
  int currentPageIndex = 0;
  int previousPage = 0;
  int price = 0;
  double opacityValue = 0;

  List<double> heights = [
    0.47.sh,
    0.47.sh,
    0.8.sh,
    0.55.sh,
    0.9.sh,
    0.9.sh,
    0.75.sh,
    0.7.sh,
    0.7.sh,
    0.7.sh,
    0.64.sh,
    1.sh,
  ];

  List<String> headers = [
    'С возвращением, Жасурбек',
    'Чего вы предлогаете и каком типе хотите вести продажу?',
    'Какой у вас жильё?',
    'Чего вы предлогаете и каком типе хотите вести продажу?',
    '',
    '',
    'Раскажите гостям о примуществах ващего жиля',
    'Добавить фото жиля',
    'Добавить фото жиля',
    'Довайте придумаем яркий заголовок',
    'Довайте установим цену',
    '',
  ];

  final List<String> options = [
    'Андижанская область',
    'Бухарская область',
    'Джизакская область',
    'Кашкадарьинская область',
    'Навоийская область',
    'Наманганская область',
    'Самаркандская область',
    'Сурхандарьинская область',
    'Сырдарьинская область',
    'Ташкентская область',
    'Ферганская область',
    'Хорезмская область',
    'Республика Каракалпакстан',
    'Город Ташкент',
  ];
  String? selectedOption = 'Город Ташкент';

  void navigate(int index) {
    animatePage(index);
    previousPage = currentPageIndex;
    currentPageIndex = index;
    notifyListeners();
  }

  void animate() async {
    opacityValue = 0;
    await Future.delayed(const Duration(seconds: 1));
  }

  void reverse() async {
    opacityValue = 1;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
  }

  void animatePage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  updateHeight() {
    isExpanded = !isExpanded;
    if (isExpanded) {
      heights[2] = 0.88.sh;
    } else {
      heights[2] = 0.68.sh;
    }
    notifyListeners();
  }

  updatePrice(bool isIncreased) {
    isIncreased
        ? price += 1
        : price != 0
            ? price -= 1
            : null;
    notifyListeners();
  }

  chooseOption(String option) {
    selectedOption = option;
    notifyListeners();
  }
}
