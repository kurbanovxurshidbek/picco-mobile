import 'dart:convert';
import 'package:picco/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Translation keys
enum LocalizationKey {
  str_intro,
  str_buy_houses,
  str_rent_houses,
  str_houses,
  str_for_business,
  str_new_buildings,
  str_country_houses,
  str_cottages,
  str_hotels,
  str_choose_city,
  str_attractive_places,
  str_tashkent,
  str_samarkand,
  str_khiva,

  str_user_management,
  str_billing_details,
  str_settings,
  str_notifications,
  str_information,
  str_log_out,

  str_full_name,
  str_phone_number,
  str_password,
  str_confirm_password,

  str_your_phone_number,
  str_enter_phone_number,

  str_your_code,
  str_sent_sms,

  str_favorite_page_header,
  str_empty_favorite_page,

  str_location_text_button,
  str_read_more,

  str_messages_page_header,
  str_empty_messages_page,

  str_dark_mode,
  str_language,

  str_clear,
  str_clear_all,
  str_done,

  str_wifi,
  str_kitchen,
  str_air_conditioning,
  str_washing_machine,
  str_iron,

  str_price_range,
  str_average_price,
  str_facilities,

  str_sign_up,
  str_sign_in,
  str_already_have_an_account,
  str_dont_have_an_account,
}

/// Extension to translate
extension LocalizationKeysExtension on LocalizationKey {
  // # In order to get the key (LocalizationKey.str_intro => str_intro)
  String get _str => this.toString().split('.').last;

  String tr(BuildContext context) {
    return LocalizationService.of(context)?.translate(_str) ?? '';
  }
}

/// Service
class LocalizationService {
  Locale locale;
  late Map<String, String> _localizedValues;
  static const LocalizationsDelegate<LocalizationService> delegate =
      _LocalizationServiceDelegate();

  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('ru', 'RU'),
    Locale('uz', 'UZ'),
  ];

  static const localizationsDelegate = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const List<String> languagesList = [
    'English',
    'Русский',
    'O\'zbek',
  ];

  LocalizationService({required this.locale});

  static LocalizationService? of(BuildContext context) {
    return Localizations.of<LocalizationService>(context, LocalizationService);
  }

  Future<void> load() async {
    String jsonString = await rootBundle.loadString(
        'assets/languages/${locale.languageCode}-${locale.countryCode}.json');

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedValues =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String? translate(String key) {
    return _localizedValues[key];
  }

  // #Check locale
  static Locale? localeResolutionCallBack(
      Locale? locale, Iterable<Locale>? supportedLocales) {
    if (supportedLocales != null && locale != null) {
      return supportedLocales.firstWhere(
        (element) => element.languageCode == locale.languageCode,
        orElse: () => supportedLocales.first,
      );
    }
    return null;
  }
}

/// Delegate
class _LocalizationServiceDelegate
    extends LocalizationsDelegate<LocalizationService> {
  const _LocalizationServiceDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ru', 'en', 'uz'].contains(locale.languageCode);
  }

  @override
  Future<LocalizationService> load(Locale locale) async {
    LocalizationService localization = LocalizationService(locale: locale);
    await localization.load();
    return localization;

    // return SynchronousFuture<LocalizationService>(
    //   LocalizationService(locale: locale),
    // );
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<LocalizationService> old) {
    return false;
  }
}

/// Controller
class LocalizationViewModel extends ChangeNotifier {
  String? currentLanguage;
  Locale? _locale;

  Locale? get getlocale => _locale;

  void changeLocale(String newLocale) {
    Locale convertedLocale;

    switch (newLocale) {
      case 'English':
        convertedLocale = const Locale('en', 'US');
        break;
      case 'Русский':
        convertedLocale = const Locale('ru', 'RU');
        break;
      case 'O\'zbek':
        convertedLocale = const Locale('uz', 'UZ');
        break;
      default:
        convertedLocale = const Locale('ru', 'RU');
    }

    currentLanguage = newLocale;
    _locale = convertedLocale;
    notifyListeners();
  }

  defineCurrentLanguage(BuildContext context) {
    String definedCurrentLanguage;

    if (currentLanguage != null) {
      definedCurrentLanguage = currentLanguage!;
    } else {
      switch (Localizations.localeOf(context).languageCode.toString()) {
        case 'en':
          definedCurrentLanguage = 'English';
          break;
        case 'ru':
          definedCurrentLanguage = 'Русский';
          break;
        case 'uz':
          definedCurrentLanguage = "O\'zbek";
          break;
        default:
          definedCurrentLanguage = 'Русский';
      }
    }
    return definedCurrentLanguage;
  }

  currentLocale(BuildContext context) {
    if (HiveService.box.containsKey(HiveService.key(StorageKeys.LANGUAGE))) {
      switch (HiveService.loadString(HiveService.key(StorageKeys.LANGUAGE))) {
        case 'English':
          return const Locale('en', 'US');
        case 'Русский':
          return const Locale('ru', 'RU');
        case 'O\'zbek':
          return const Locale('uz', 'UZ');
      }
    } else {
      return const Locale(
          'ru', 'RU'); // By default the app's language is Russian
    }
  }
}


class LanguageLabels {
  final String flag;
  final String language;
  bool isChecked;

  LanguageLabels(
      {required this.flag, required this.language, required this.isChecked});
}

class LanguageLabelsList {
  String chosenLanguage = '';

  storeNewLocale(String language) {
    HiveService.storeString(HiveService.key(StorageKeys.LANGUAGE), language);
  }

  update(BuildContext context){
    if(LocalizationViewModel().defineCurrentLanguage(context) != HiveService.loadString(HiveService.key(StorageKeys.LANGUAGE))){
      storeNewLocale(LocalizationViewModel().defineCurrentLanguage(context));
    }
  }

  List<LanguageLabels> locales(BuildContext context) {
    if (HiveService.box.containsKey(HiveService.key(StorageKeys.LANGUAGE))) {
      chosenLanguage = HiveService.loadString(HiveService.key(StorageKeys.LANGUAGE));
    } else {
      chosenLanguage = 'Русский';
    }
    return [
      LanguageLabels(
          flag: '🇺🇸',
          language: 'English',
          isChecked: chosenLanguage == 'English',
      ),
      LanguageLabels(
          flag: '🇷🇺',
          language: 'Русский',
          isChecked: chosenLanguage == 'Русский',
      ),
      LanguageLabels(
          flag: '🇺🇿',
          language: 'O\'zbek',
          isChecked: chosenLanguage == 'O\'zbek',
      ),
    ];
  }
}
