import 'package:picco/customer/models/favorite_model.dart';
import 'package:picco/customer/view/pages/favorite/local_widgets/favorite_houses_page.dart';
import 'package:flutter/material.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildScale extends StatelessWidget {
  const BuildScale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children:
              favourites.map((FavouriteModel e) => card(e, context)).toList(),
        ),
      ),
    );
  }

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
