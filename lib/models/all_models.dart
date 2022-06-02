import 'package:picco/customer/view/pages/home/home_page.dart';
import 'package:picco/customer/view/pages/profile/local_widgets/information_page.dart';
import 'package:picco/customer/view/pages/profile/local_widgets/notification_page.dart';
import 'package:picco/customer/view/pages/profile/local_widgets/settings_page.dart';
import 'package:picco/customer/view/pages/profile/local_widgets/user_management_page.dart';
import 'package:picco/services/localization_service.dart';
import 'package:flutter/cupertino.dart';

class AppArt {
  String name;
  String logo;

  AppArt({
    required this.name,
    required this.logo,
  });
}

class AppArtList {
  static List<AppArt> Function(BuildContext) products =
      (BuildContext context) => [
    AppArt(
      name: LocalizationKey.str_houses.tr(context),
      logo: 'assets/icons/home_page_icons/hotels.png',
    ),
    AppArt(
      name: LocalizationKey.str_for_business.tr(context),
      logo: 'assets/icons/home_page_icons/office-buildings.png',
    ),
    AppArt(
      name: LocalizationKey.str_new_buildings.tr(context),
      logo: 'assets/icons/home_page_icons/office-buildings.png',
    ),
    AppArt(
      name: LocalizationKey.str_country_houses.tr(context),
      logo: 'assets/icons/home_page_icons/country-houses.png',
    ),
    AppArt(
      name: LocalizationKey.str_cottages.tr(context),
      logo: 'assets/icons/home_page_icons/pavilions.png',
    ),
    AppArt(
      name: LocalizationKey.str_hotels.tr(context),
      logo: 'assets/icons/home_page_icons/hotels.png',
    ),
  ];
}

class ImageCity {
  final String image;
  final String name;

  ImageCity({
    required this.image,
    required this.name,
  });
}

class ImageCityList {
  static List<ImageCity> Function(BuildContext) list =
      (BuildContext context) => [
    ImageCity(
      image: 'assets/images/tashkent.jpg',
      name: LocalizationKey.str_tashkent.tr(context),
    ),
    ImageCity(
      image: 'assets/images/samarkand.jpg',
      name: LocalizationKey.str_samarkand.tr(context),
    ),
    ImageCity(
      image: 'assets/images/khiva.jpg',
      name: LocalizationKey.str_khiva.tr(context),
    ),
  ];
}

class AttractivePlaces {
  final String image;
  final String name;
  final String description;

  AttractivePlaces(
      {required this.image, required this.name, required this.description});
}

class AttractivePlacesList {
  static List<AttractivePlaces> Function(BuildContext) list =
      (BuildContext context) => [
    AttractivePlaces(
      image: 'assets/images/tashkent.jpg',
      name: LocalizationKey.str_tashkent.tr(context),
      description:
      "The Tashkent Television Tower (Uzbek:Toshkent Teleminorasi) is a 375-metre-high (1,230 ft) tower, located in Tashkent, Uzbekistan and is the twelfth tallest tower in the world.",
    ),
    AttractivePlaces(
      image: 'assets/images/samarkand.jpg',
      name: LocalizationKey.str_samarkand.tr(context),
      description:
      "The Tashkent Television Tower (Uzbek:Toshkent Teleminorasi) is a 375-metre-high (1,230 ft) tower, located in Tashkent, Uzbekistan and is the twelfth tallest tower in the world.",
    ),
    AttractivePlaces(
      image: 'assets/images/khiva.jpg',
      name: LocalizationKey.str_khiva.tr(context),
      description:
      "The Tashkent Television Tower (Uzbek:Toshkent Teleminorasi) is a 375-metre-high (1,230 ft) tower, located in Tashkent, Uzbekistan and is the twelfth tallest tower in the world.",
    ),
  ];
}

class HomeService {
  String name;
  bool isChecked;

  HomeService({
    required this.name,
    this.isChecked = false,
  });

  @override
  String toString() {
    return 'HomeService{name: $name, isChecked: $isChecked}';
  }
}

class ProfileModel {
  String text;
  IconData icon;
  Widget id;

  ProfileModel({required this.text, required this.icon, required this.id});

  static List<ProfileModel> Function(BuildContext) elements =
      (BuildContext context) => [
    ProfileModel(
      text: LocalizationKey.str_user_management.tr(context),
      icon: CupertinoIcons.person,
      id: UserManagementPage(),
    ),
    ProfileModel(
      text: LocalizationKey.str_settings.tr(context),
      icon: CupertinoIcons.settings,
      id: const SettingsPage(),
    ),
    ProfileModel(
      text: LocalizationKey.str_notifications.tr(context),
      icon: CupertinoIcons.bell,
      id: const NotificationPage(),
    ),
    ProfileModel(
      text: LocalizationKey.str_information.tr(context),
      icon: CupertinoIcons.info,
      id: const InformationPage(),
    ),
    ProfileModel(
      text: LocalizationKey.str_log_out.tr(context),
      icon: CupertinoIcons.arrow_right,
      id: const HomePage(),
    )
  ];
}

//Managements TextFields
class TextFieldLabels {
  String? text2;

  TextFieldLabels({this.text2});

  static List<TextFieldLabels> Function(BuildContext) labels =
      (BuildContext context) => [
    TextFieldLabels(text2: LocalizationKey.str_full_name.tr(context)),
    TextFieldLabels(
        text2: LocalizationKey.str_phone_number.tr(context)),
    TextFieldLabels(text2: LocalizationKey.str_password.tr(context)),
  ];
}