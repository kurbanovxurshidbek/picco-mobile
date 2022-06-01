import 'package:picco/seller/announcement/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class FirstBody extends StatelessWidget {
  const FirstBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.select((AnnouncementProvider provider) => provider);

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
          const Spacer(),
          MaterialButton(
            height: 50,
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text(
              'Старт',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: const Color(0xff7842D0),
            onPressed: () {
              provider.navigate(1);
            },
          )
        ],
      ),
    );
  }
}

