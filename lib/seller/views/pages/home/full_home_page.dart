import 'package:picco/customer/models/favorite_model.dart';
import 'package:picco/seller/views/pages/intro/intro_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class FullHomePage extends StatefulWidget {
  const FullHomePage({Key? key}) : super(key: key);

  @override
  State<FullHomePage> createState() => _FullHomePageState();
}

class _FullHomePageState extends State<FullHomePage> {
  int sellectedIndex = 0;
  List<String> name = [
    "All",
    "House / Flat",
    "Buildings for business",
    "New buildings",
    "Country houses",
    "Cottages",
    "Hotels",
  ];

  List<String> rooms = [
    "m2",
    "rooms",
    "beds",
    "baths",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///header
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
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
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Сегодня",
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.bell,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Привет, Сдесь вы можете продать или\nсдать в аренду свои дома без всяких усилий",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: MaterialButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r)),
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IntroPage()));
                            });
                          },
                          child: const Text("Создать обявления"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Text(
                  "Наши дома",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
              ),
              favourites.isNotEmpty
                  ? Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w),
                          width: double.infinity,
                          height: 40.h,
                          child: ListView.builder(
                            itemCount: name.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                (index != 1 + name.length)
                                    ? houseNameContainer(index)
                                    : houseNameContainer(index),
                          ),
                        ),
                        SizedBox(
                          height: 0.5.sh,
                          child: ListView(children: [
                            Column(
                              children: favourites.map((FavouriteModel e) => card(e, context)).toList(),
                            ),
                          ]),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 600.w,
                            height: 320,
                            child: Lottie.asset("assets/lottie/home.json")),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "oбявлений пока нет",
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  /// Text upper site button
  GestureDetector houseNameContainer(int index) => GestureDetector(
        onTap: () {
          setState(() {
            sellectedIndex = index;
          });
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(5.w),
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
              color: sellectedIndex == index
                  ? const Color(0xff7169F9)
                  : Colors.white,
              border: Border.all(
                  width: 0.5,
                  color: sellectedIndex == index ? Colors.white : Colors.black),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            name[index],
            style: TextStyle(
              color: sellectedIndex == index ? Colors.white : Colors.black,
              fontSize: 15,
            ),
          ),
        ),
      );

  Widget card(FavouriteModel element, BuildContext context,) {
    return Container(
      height: 80.h,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h,top: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 86.h,
            width: 109.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(element.homes.last.mainImage),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tashkent c",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp,
                  ),
                ),
                Spacer(),
                Text(
                  "Yakkasaroy region",
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${int.tryParse('3')} ${int.tryParse('3')! > 1 ? 'beds' : 'bed'}",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "${int.tryParse('2')} ${int.tryParse('2')! > 1 ? 'baths' : 'bath'}",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "${int.tryParse('3')} ${int.tryParse('3')! > 1 ? 'rooms' : 'room'}",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '${int.tryParse('200')}m',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                        fontSize: 6.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "200\$",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          )
        ],
      ),
    );
  }
}
