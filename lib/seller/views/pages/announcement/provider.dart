import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picco/models/home_model.dart';
import 'package:picco/services/image_picker_service.dart';
import 'package:picco/services/log_service.dart';
import 'package:picco/services/store_service.dart';

class AnnouncementProvider extends ChangeNotifier {
  final pageController = PageController();

  final addressController = TextEditingController();
  final titleController = TextEditingController();
  final addressFocus = FocusNode();
  final titleFocus = FocusNode();

  bool isDisabled = true;
  bool showLottie = false;
  int currentPageIndex = 0;
  int price = 0;
  double opacityValue = 0;

  int selectTypeHouseIndex = 0;
  int selectTypeSaleIndex = 0;
  int selectFacilityIndex = 0;

  List<bool> listFacilities = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

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

  /// * for usage
  String sellType = 'buy_houses';
  String categoryType = 'house';

  /// * House Image
  var images = <XFile>[];
  var listOfUploadTask = <int, UploadTask>{};
  List<String> imagesDownloadUrls = [];

  // first page
  void chooseSaleType(index) {
    selectTypeSaleIndex = index;
    sellType = homeSellType[index];
    notifyListeners();
  }

  // second page
  void chooseHouseType(index) {
    selectTypeHouseIndex = index;
    categoryType = homeCategoryType[index];
    notifyListeners();
  }

  Future<void> getCameraImage() async {
    XFile? cameraImage = await pickerService.openPicker(ImageSource.camera);

    if (cameraImage != null) {
      images.add(cameraImage);
      showLottie = true;
      notifyListeners();

      await storeImagesToFirebaseStorage();
    }
  }

  Future<void> getFileImages() async {
    images = (await pickerService.getPickedImages()) ?? <XFile>[];
    showLottie = true;
    notifyListeners();

    await storeImagesToFirebaseStorage();
  }

  Future<void> storeImagesToFirebaseStorage() async {
    if (images.isNotEmpty) {
      final List<File> listOfImages = images.map((e) => File(e.path)).toList();

      for (int  i = 0; i < listOfImages.length; i++) {
        final uploadTask = StoreService.uploadFile(listOfImages[i]);

        if (UploadTask == null) {
            images.removeAt(i);
            continue;
        }


        listOfUploadTask[i] = uploadTask!;
      }
      notifyListeners();

      for (int i = 0; i < listOfUploadTask.length; i++) {
        final snapshot = await listOfUploadTask[i]!.whenComplete(() {});
        final downloadUrlLink = await snapshot.ref.getDownloadURL();
        imagesDownloadUrls.add(downloadUrlLink);
      }
    }
    showLottie = false;
    notifyListeners();

    imagesDownloadUrls.forEach(Log.i);
  }

  Future<void> sendHouseToFirebaseFirestore(BuildContext context) async {
    // final houseModel = HomeModel(
    //   sellType: sellType,
    //   homeType: categoryType,
    //   city: cityController.text.trim(),
    //   district: districtController.text.trim(),
    //   street: streetController.text.trim(),
    //   price: priceController.text.trim(),
    //   definition: definitionController.text.trim(),
    //   geo: Geo(
    //       latitude: double.parse(langController.text.trim()),
    //       longitude: double.parse(longController.text.trim())),
    //   houseFacilities: listFacilities,
    //   bedsCount: bedController.text.trim(),
    //   bathCount: bathController.text.trim(),
    //   roomsCount: roomController.text.trim(),
    //   houseSize: houseSizeController.text.trim(),
    //   houseImages: imagesDownloadUrls,
    // );

    // await FirestoreService.storeHouse(houseModel);
  }

  // Future<void> getHousesInFirebaseFirestore() async {
  //   firebaseHouses = await FirestoreService.getHouses(
  //     sellType: sellType,
  //     categoryType: categoryType,
  //   );
  //
  //   for (var element in firebaseHouses) {
  //     Log.i(element.toString());
  //   }
  // }


  void updateFacilities(int index) {
    listFacilities[index] = !listFacilities[index];
    notifyListeners();
  }

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
}
