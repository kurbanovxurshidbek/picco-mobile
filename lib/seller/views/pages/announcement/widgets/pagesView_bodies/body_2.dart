import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondBody extends StatelessWidget {
  const SecondBody({Key? key}) : super(key: key);
  static const Map<String, String> data = {
    'Продать жильё': 'Продать многокомнатную квартиру, зданию или участок',
    'Сдать в аренду жильё':
        'Сдать в аренду многокомнатную квартиру, отель или место для бизнеса',
  };

  @override
  Widget build(BuildContext context) {
    // final provider = context.select((AnnouncementProvider provider) => provider);
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
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
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
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
    );
  }
}
