import 'package:picco/customer/view/pages/home/home_page.dart';
import 'package:picco/example/home_1/view.dart';
import 'package:picco/services/hive_service.dart';
import 'package:picco/services/localization_service.dart';
import 'package:picco/themes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveService.DB_NAME);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final LocalizationViewModel model = LocalizationViewModel();
  final bool isDarkMode = false;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => model,
      child: Consumer<LocalizationViewModel>(
        builder: (context, provider, child) => ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: isDarkMode ? Themes().darkTheme : Themes().lightTheme,
            locale: model.currentLocale(context), //Provider.of<LocalizationViewModel>(context).getlocale,
            localizationsDelegates: LocalizationService.localizationsDelegate,
            supportedLocales: LocalizationService.supportedLocales,
            home: child,
          ),
          child: const HomePage(),
        ),
      ),
    );
  }
}
