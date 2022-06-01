import 'package:picco/seller/views/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'intro_page.dart';

class FirstIntroPage extends StatelessWidget {
  FirstIntroPage({Key? key}) : super(key: key);

  Color appBarIconsOpacity = Colors.grey.withOpacity(0.2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: appBarIconsOpacity,
          ),
          child: const Icon(Icons.close, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: appBarIconsOpacity,
              ),
              child: const Text("Помощь"),
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1, -1),
            end: Alignment(2.7, 0),
            colors: [
              Color(0xff7842D0),
              Color(0xffE41547),
              Color(0xffD82490),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 281.h,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'С возвращением, Жасурбек',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: BottomSheetCustomWidget(
                sheetFactories: const [false, false, true, false],
                isScrollable: false,
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Станьте хозяином всего за 5 шагов',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 30.sp),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Присоединитесь. Мы с радостью поможем',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    const Spacer(),
                    MaterialButton(
                      height: 50,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        'Старт',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: const Color(0xff7842D0),
                      onPressed: () {
                        IntroController.navigate(1);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
