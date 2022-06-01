import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstBody extends StatelessWidget {
  const FirstBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final provider = context.select((AnnouncementProvider provider) => provider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Станьте хозяином всего за 5 шагов',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.sp),
          ),
          SizedBox(height: 30.h),
          Text(
            'Присоединитесь. Мы с радостью поможем',
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
