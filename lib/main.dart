import 'package:picco/customer/view/pages/home/home_page.dart';
import 'package:picco/services/hive_service.dart';
import 'package:picco/services/localization_service.dart';
import 'package:picco/themes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'seller/views/seller_page_controller.dart';
import 'services/log_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      create: (context) => LocalizationViewModel(),
      child: Consumer<LocalizationViewModel>(
        builder: (context, provider, child) {
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
