import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'package:picco/seller/views/pages/announcement/provider.dart';
import 'package:provider/provider.dart';

class SecondBody extends StatelessWidget {
  SecondBody({Key? key}) : super(key: key);

  List<Map<String, String>> data = [
    {'Продать жильё': 'Продать многокомнатную квартиру, зданию или участок'},
    {
      'Сдать в аренду жильё':
          'Сдать в аренду многокомнатную квартиру, отель или место для бизнеса'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final watchProvider = context.watch<AnnouncementProvider>();
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          for (int index = 0; index < data.length; index++)
            Container(
              width: 1.sw,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: watchProvider.selectTypeSaleIndex == index
                      ? Colors.black
                      : Colors.grey.shade300,
                  width: watchProvider.selectTypeSaleIndex == index ? 1.5 : 1.4,
                ),
                color: watchProvider.selectTypeSaleIndex == index
                    ? Colors.grey.withOpacity(0.05)
                    : Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[index].keys.first,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    data[index].values.first,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ).onTap(function: () {
              watchProvider.chooseSaleType(index);
            }),
        ],
      ),
    );
  }
}
