import 'package:picco/customer/view/pages/search/detail_page.dart';
import 'package:picco/animations/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:picco/models/home_model.dart';

class HomeSnackBarElement extends StatelessWidget {
  final HomeModel homeModel;
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
                const _HouseImage(),
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
                              '${homeModel.city} city',
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
                          '${homeModel.district} region',
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                        ),
                        const Spacer(),
                        _HomeDetails(homeModel: homeModel),
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
        builder: (context) => DetailPage(homeModel: homeModel),
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

class _HouseImage extends StatelessWidget {
  const _HouseImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeModel =
        context.findAncestorWidgetOfExactType<HomeSnackBarElement>()!.homeModel;
    return Expanded(
      flex: 2,
      child: Stack(
        children: [
          Image.asset(
            homeModel.houseImages.first,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ],
      ),
    );
  }
}

class _HomeDetails extends StatelessWidget {
  final HomeModel homeModel;

  const _HomeDetails({Key? key, required this.homeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${homeModel.bedsCount} ${int.tryParse(homeModel.bedsCount)! > 1 ? 'beds' : 'bed'}",
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          "${homeModel.bathCount} ${int.tryParse(homeModel.bathCount)! > 1 ? 'baths' : 'bath'}",
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          "${homeModel.roomsCount} ${int.tryParse(homeModel.roomsCount)! > 1 ? 'rooms' : 'room'}",
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          '${homeModel.houseSize}m',
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
    );
  }
}

