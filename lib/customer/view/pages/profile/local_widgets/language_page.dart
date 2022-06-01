import 'package:picco/services/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LanguageSettings extends StatefulWidget {
  const LanguageSettings({Key? key}) : super(key: key);

  static const String id = '/language_settings';

  @override
  State<LanguageSettings> createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageSettings> {
  String? name;
  String? newLanguage;
  LanguageLabelsList languageLabelsList = LanguageLabelsList();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        LanguageLabelsList().update(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            Consumer<LocalizationViewModel>(
              builder: (context, model, child) {
                return IconButton(
                  splashRadius: 1,
                  color: const Color(0xff4F4E9A),
                  icon: const Icon(Icons.done_rounded),
                  iconSize: 28,
                  onPressed: () {
                    if (newLanguage != null) {
                      model.changeLocale(newLanguage!);
                      Navigator.pop(context);
                    }
                  },
                );
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ///header
              Row(
                children: [
                  SizedBox(width: 0.05.sw),
                  const Icon(
                    Icons.language_outlined,
                    size: 25,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    LocalizationKey.str_language.tr(context),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              ...languageLabelsList
                  .locales(context)
                  .map((e) => listTile(e))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget listTile(LanguageLabels label) {
    return CheckboxListTile(
      title: Text(label.language),
      secondary: Text(
        label.flag,
        style: const TextStyle(fontSize: 20),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      autofocus: false,
      isThreeLine: false,
      activeColor: const Color(0xFF4F4E9A),
      checkColor: Colors.white,
      value: label.isChecked,
      onChanged: (value) {
        setState(
          () {
            label.isChecked = value!;
            for (var element in languageLabelsList.locales(context)) {
              if (element.language == label.language) {
                languageLabelsList.storeNewLocale(element
                    .language); // it should not be here -> should be in apd
                setState(() {
                  element.isChecked = true;
                  newLanguage = element.language;
                });
              } else {
                setState(() {
                  element.isChecked = false;
                });
              }
            }
          },
        );
      },
    );
  }
}
