import 'package:picco/customer/models/favorite_model.dart';
import 'package:picco/customer/view/pages/favorite/local_widgets/favorite_houses_page.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'package:picco/seller/views/pages/announcement/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({Key? key}) : super(key: key);

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
                            borderRadius: BorderRadius.circular(5.r),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const AnnouncementPage()));
                        },
                        child: const Text("Создать обявления"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                "Наши дома",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
            ),
            !favourites.isNotEmpty
                ? Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  height: 0.5.sh,
                  child: ListView(children: [
                    Column(
                      children: favourites
                          .map((FavouriteModel e) => card(e, context))
                          .toList(),
                    ),
                  ]),
                ),
              ],
            )
                : Column(
              children: [
                const SizedBox(width: double.infinity),
                SizedBox(
                  height: 200.h,
                  child: Lottie.asset("assets/lottie/home.json"),
                ),
                const Text("Oбявлений пока нет"),
                SizedBox(height: 20.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Tekst apper site button
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

  GestureDetector card(FavouriteModel element, BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        height: 70.h,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                element.homes.last.mainImage,
                width: 65.h,
                height: 65.h,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 15.w),
            Text(
              element.favouriteName,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
      ),
    ).onTap(function: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FavoriteHousesPage(),
          settings: RouteSettings(arguments: element),
        ),
      );
    });
  }
}
