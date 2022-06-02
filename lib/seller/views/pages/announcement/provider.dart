import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnnouncementProvider extends ChangeNotifier {
  PageController pageController = PageController();

  TextEditingController addressController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  FocusNode addressFocus = FocusNode();
  FocusNode titleFocus = FocusNode();

  bool isDisabled = true;
  int currentPageIndex = 0;
  int price = 0;
  double opacityValue = 0;

  int selectTypeHouseIndex = 0;
  int selectTypeSaleIndex = 0;
  int selectFacilityIndex = 0;

  List<String> listFacilities = [];

  List<double> heights = [
    0.47.sh,
    0.43.sh, // choose type sale
    0.6.sh, // choose type house
    0.4.sh, // choose location
    0.6.sh, // choose facility
    0.5.sh,
    0.7.sh,
    0.7.sh,
    0.64.sh,
    0.87.sh,
  ];

  List<String> headers = [
    'С возвращением, Жасурбек',
    'Чего вы предлогаете и каком типе хотите вести продажу?',
    'Какой у вас жильё?',
    'Чего вы предлогаете и каком типе хотите вести продажу?',
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

  updatePageIndex(index) {
    currentPageIndex = index;
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

  updateButtonDisability(bool _isDisabled) {
    isDisabled = _isDisabled;
    notifyListeners();
  }

  chooseHouseType(index) {
    selectTypeHouseIndex = index;
    notifyListeners();
  }

  chooseSaleType(index) {
    selectTypeSaleIndex = index;
    notifyListeners();
  }

  chooseFacilities(String item) {
    listFacilities.add(item);
    notifyListeners();
  }

  removeFacilities(String item){
    listFacilities.remove(item);
    notifyListeners();
  }
}
