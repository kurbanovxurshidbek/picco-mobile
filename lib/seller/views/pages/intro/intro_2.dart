import 'package:picco/seller/views/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'intro_page.dart';

class SecondIntroPage extends StatelessWidget {
  const SecondIntroPage({Key? key}) : super(key: key);

  static const Map<String, String> data = {
    'Продать жильё': 'Продать многокомнатную квартиру, зданию или участок',
    'Сдать в аренду жильё':
        'Сдать в аренду многокомнатную квартиру, отель или место для бизнеса',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          splashRadius: 1,
          icon: Icon(
            Icons.cancel,
            color: Colors.grey.withOpacity(0.6),
            size: 34,
          ),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              child: Text(
                'Помощь',
                style: TextStyle(color: Colors.white, fontSize: 15.sp),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.grey.withOpacity(0.6),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1, 0),
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
              height: 370.h,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Чего вы предлогаете и коком типе хотите вести продажу?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: BottomSheetCustomWidget(
                  sheetFactories: const [false, true, false, false],
                  isScrollable: false,
                  padding: EdgeInsets.zero,
                  body: Column(
                    children: [
                      Expanded(child: ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: data.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 20.h);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color: Colors.black)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.keys.toList()[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 18.sp),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  data.values.toList()[index],
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          );
                        },
                      ),),
                      const Divider(color: Color(0xff7842D0), thickness: 2,),
                      Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                                child: const Text('Назад', style: TextStyle(fontSize: 18),),
                                color: Colors.transparent,
                                elevation: 0.0,
                                onPressed: (){
                                  IntroController.navigate(0);
                                },
                            ),
                            MaterialButton(
                                child: const Text('Далее', style: TextStyle(fontSize: 18, color: Colors.white,),),
                                color: const Color(0xff7842D0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)
                                ),
                                onPressed: (){

                                  IntroController.navigate(2);
                                }
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
