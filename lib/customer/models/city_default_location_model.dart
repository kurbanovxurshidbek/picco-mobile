import 'package:picco/services/localization_service.dart';
import 'package:flutter/cupertino.dart';

class CityLocationModel {
  String cityName;
  double latitude;
  double longitude;

  CityLocationModel({
    required this.cityName,
    required this.latitude,
    required this.longitude,
  });
}

CityLocationModel getCityInPosition(String city, BuildContext context) {
  if (city == LocalizationKey.str_tashkent.tr(context)) {
    return CityLocationModel(
      cityName: 'Toshkent',
      latitude: 41.30943824734748,
      longitude: 69.24100778996944,
    );
  } else if (city == LocalizationKey.str_samarkand.tr(context)) {
    return CityLocationModel(
      cityName: 'Samarqand',
      latitude: 39.62682300198974,
      longitude: 66.97521004825829,
    );
  } else if (city == LocalizationKey.str_khiva.tr(context)) {
    return CityLocationModel(
      cityName: 'Hiva',
      latitude: 41.389522632744246,
      longitude: 60.344484597444534,
    );
  } else {
    return CityLocationModel(
      cityName: 'Unknown',
      latitude: 0,
      longitude: 0,
    );
  }
}

List<CityLocationModel> cityLocations = [
  CityLocationModel(
    cityName: '',
    latitude: 0,
    longitude: 0,
  ),
];
