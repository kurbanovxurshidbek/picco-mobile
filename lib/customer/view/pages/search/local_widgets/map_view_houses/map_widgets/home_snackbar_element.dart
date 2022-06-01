import 'package:picco/customer/models/home_model_map.dart';
import 'package:picco/customer/view/pages/search/detail_page.dart';
import 'package:picco/customer/view/pages/search/local_widgets/map_view_houses/local_animation/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeSnackBarElement extends StatelessWidget {
  final HomeModelMap homeModel;
  final GoogleMapController mapController;

  const HomeSnackBarElement({
    Key? key,
    required this.mapController,
    required this.homeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSnackBarTap(context),
      child: FadeAnimation(
        key: UniqueKey(),
        delay: 0.5,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80.h,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Image.asset(
                        homeModel.mainImage,
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      bottom: 10.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Tashkent city',
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.all(6.0.w),
                                child: Icon(
                                  Icons.favorite_outline_rounded,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Yakkasaray region',
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                        ),
                        const Spacer(),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSnackBarTap(BuildContext context) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(homeModelMap: homeModel),
      ),
    );
    if (result is Geo) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              result.latitude,
              result.longitude,
            ),
            zoom: 20.4,
          ),
        ),
      );
    }
  }
}
