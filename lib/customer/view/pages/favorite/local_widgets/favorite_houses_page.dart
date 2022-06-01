import 'package:picco/customer/models/favorite_model.dart';
import 'package:picco/customer/models/home_model_map.dart';
import 'package:picco/services/localization_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FavoriteHousesPage extends StatelessWidget {
  const FavoriteHousesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final element = ModalRoute.of(context)!.settings.arguments as FavouriteModel;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: element.homes
              .map((HomeModelMap e) => Card(
                    elevation: 0,
                    margin: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            e.mainImage,
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ).putElevation(elevation: 6.0, radius: 10.0),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mainTextHouse(e.name),
                            mainTextHouse(e.price),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.location,
                              size: 22,
                            ),
                            secondaryTextHouse("Uzbekistan Tashkent city"),
                            TextButton(
                              onPressed: () {},
                              child: secondaryTextHouse(LocalizationKey.str_location_text_button.tr(context),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
        // body: CustomScrollView(
        //   physics: const BouncingScrollPhysics(),
        //   slivers: [
        //     SliverAppBar(
        //       pinned: true,
        //       expandedHeight: 12.h,
        //       flexibleSpace: FlexibleSpaceBar(
        //         title: Text(
        //           element.favouriteName,
        //           style: const TextStyle(fontSize: 20, color: Colors.black),
        //         ),
        //       ),
        //     ),
        //     SliverList(
        //       delegate: SliverChildBuilderDelegate(
        //         (BuildContext context, int index) {
        //           return Card(
        //             elevation: 0,
        //             margin: const EdgeInsets.all(15),
        //             shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(10)),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 ClipRRect(
        //                   borderRadius: BorderRadius.circular(10),
        //                   child: Image.asset(
        //                     element.homes[index].image,
        //                     height: 30.h,
        //                     width: 100.w,
        //                     fit: BoxFit.cover,
        //                   ),
        //                 ).putElevation(elevation: 6.0, radius: 10.0),
        //                 SizedBox(height: 2.h),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     mainTextHouse(element.homes[index].name),
        //                     mainTextHouse(element.homes[index].price),
        //                   ],
        //                 ),
        //                 Row(
        //                   children: [
        //                     const Icon(
        //                       CupertinoIcons.location,
        //                       size: 22,
        //                     ),
        //                     secondaryTextHouse("Uzbekistan Tashkent city"),
        //                     TextButton(
        //                       onPressed: () {},
        //                       child: secondaryTextHouse("location..."),
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           );
        //         },
        //         childCount: element.homes.length,
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  mainTextHouse(String name) => Text(
        name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      );

  secondaryTextHouse(String name) => Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w400),
      );
}
