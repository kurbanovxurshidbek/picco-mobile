import 'package:picco/intro/intro_page.dart';
import 'package:picco/services/hive_service.dart';
import 'package:picco/services/localization_service.dart';
import 'package:picco/themes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'customer/view/controller_pages.dart';
import 'customer/view/pages/home/home_page.dart';
import 'customer/view/pages/search/search_page.dart';
import 'seller/views/seller_page_controller.dart';
import 'services/log_service.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveService.DB_NAME);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isDarkMode = false;

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocalizationViewModel(),
      child: Consumer<LocalizationViewModel>(
        builder: (_, provider, child) {
          Log.d(provider.isUser.toString());
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: isDarkMode ? Themes().darkTheme : Themes().lightTheme,
              locale: provider.currentLocale(context),
              localizationsDelegates: LocalizationService.localizationsDelegate,
              supportedLocales: LocalizationService.supportedLocales,
              home: child,
            ),
            child: provider.isUser
                ? const HomePage()
                : const SellerPageController(),
          );
        },
      ),
    );
  }
}
