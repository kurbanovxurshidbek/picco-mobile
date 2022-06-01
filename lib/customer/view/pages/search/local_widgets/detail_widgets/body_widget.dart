import 'package:picco/customer/models/similar_ads_model.dart';
import 'package:picco/services/localization_service.dart';
import 'package:picco/customer/view/pages/search/detail_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailModel = DetailPageInherit.read(context)!.detailModel;
    final homeModelMap =
        context.findAncestorWidgetOfExactType<DetailPage>()!.homeModelMap;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    homeModelMap.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                    ),
                  ),
                  Text(
                    homeModelMap.price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              // location
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16.w,
                  ),
                  // TODO: home Model location
                  Text(
                    "Uzbekistan Tashkent city",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  GestureDetector(
                    onTap: () => detailModel.goHomeLocation(
                      context,
                      geo: homeModelMap.geo,
                    ),
                    child: Text(
                      LocalizationKey.str_location_text_button.tr(context),
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              // components
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  // TODO: home model
                  _DetailBodyHomeComponents(
                    image: 'assets/icons/hotels.png',
                    text: '3 beds',
                  ),
                  _DetailBodyHomeComponents(
                    image: 'assets/icons/hotels.png',
                    text: '3 beds',
                  ),
                  _DetailBodyHomeComponents(
                    image: 'assets/icons/hotels.png',
                    text: '3 beds',
                  ),
                  _DetailBodyHomeComponents(
                    image: 'assets/icons/hotels.png',
                    text: '3 beds',
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              // description
              Text(
                "Description",
                style: TextStyle(
                  color: const Color(0xff4F4E9A),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.h),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          'If you dreamed of buying an apartment in a friendly family complex - welcome.',
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    TextSpan(
                      text: LocalizationKey.str_read_more.tr(context),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // TODO: more text....
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              // offers
              Text(
                "What this place offers",
                style: TextStyle(
                  color: const Color(0xff4F4E9A),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.h),
              for (int i = 0; i < 5; i++)
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/hotels.png',
                      height: 25.w,
                      width: 25.w,
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      'Fireplace in the hall.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10.r),
                child: Container(
                  height: 54.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.w),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    'Show all convenience: 5',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                "Similar ads",
                style: TextStyle(
                  color: const Color(0xff4F4E9A),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            itemCount: simAdsData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => (index != (simAdsData.length - 1))
                ? _SimilarAdsCard(simAdsItem: simAdsData[index])
                : Row(
                    children: [
                      _SimilarAdsCard(simAdsItem: simAdsData[index]),
                      SizedBox(width: 20.w),
                    ],
                  ),
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}

class _SimilarAdsCard extends StatelessWidget {
  final SimilarAdsModel simAdsItem;

  const _SimilarAdsCard({
    Key? key,
    required this.simAdsItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailModel = DetailPageInherit.watch(context)!.detailModel;

    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      margin: EdgeInsets.only(left: 20.w, bottom: 10.w),
      child: SizedBox(
        width: 185.w,
        height: 200.h,
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: double.infinity,
              height: 114.h,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10.r),
                ),
                image: DecorationImage(
                  image: AssetImage(simAdsItem.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: IconButton(
                icon: simAdsItem.liked
                    ? const Icon(
                        Icons.favorite_outlined,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.white,
                      ),
                onPressed: () => detailModel.likeButton(simAdsItem),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      simAdsItem.locationName,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          simAdsItem.prise,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${simAdsItem.roomsCount} ${simAdsItem.roomsCount > 1 ? 'rooms' : 'room'}",
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              simAdsItem.space,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DetailBodyHomeComponents extends StatelessWidget {
  final String image;
  final String text;

  const _DetailBodyHomeComponents({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 70.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.grey.shade50,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 0.001,
            blurRadius: 0.1,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 25.h,
          ),
          SizedBox(height: 2.h),
          Text(
            text,
            style: TextStyle(fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}
