
import 'package:http/http.dart';

class LocationService {
  static bool isTester = true;

  static String BASE = "mvs.bslmeiyu.com";

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  // * Http Apis
  static String API_PLACE_ID = '/maps/api/place/findplacefromtext/json';
  static String API_PLACE = '/api/v1/config/place-api-autocomplete';

  // * Http Requests
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // * Http params
  static Map<String, String> paramsEmpty() => {};

  static Map<String, String> paramsPlaceID({
    required String input,
  }) =>
      {
        'input': input,
        'inputtype': 'textquery',
        'key': 'AIzaSyDphvzw5vOuLtIp9TifALrLxMYIuSx1TiY',
      };

  static Map<String, String> paramsSearch({
    required String text,
  }) =>
      {
        'search_text': "Uzbekistan, $text",
      };
}