import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'package:provider/provider.dart';

import '../../provider.dart';

class ThirdBody extends StatelessWidget {
  const ThirdBody({Key? key}) : super(key: key);
  static const Map<String, String> dataRent = {
    'Дом / квартира': 'assets/images/1.png',
    'Здание для бизнеса': 'assets/images/2.png',
    'Новостройки': 'assets/images/3.png',
    'Коттедж': 'assets/images/4.png',
    'Гостиницы': 'assets/images/5.png',
    'Загородные дома': 'assets/images/6.png',
  };
  static const Map<String, String> dataBuy = {
    'Дом / квартира': 'assets/images/1.png',
    'Здание для бизнеса': 'assets/images/2.png',
    'Новостройки': 'assets/images/3.png',
    'Коттедж': 'assets/images/4.png',
  };

  @override
  Widget build(BuildContext context) {
    final watchProvider = context.watch<AnnouncementProvider>();
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
      physics: const BouncingScrollPhysics(),
      itemCount: dataRent.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 20.h);
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(
            left: 15,
            right: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: watchProvider.selectTypeHouseIndex == index
                  ? Colors.black
                  : Colors.grey.shade300,
              width: watchProvider.selectTypeHouseIndex == index ? 1.5 : 1.3,
            ),
            color: watchProvider.selectTypeHouseIndex == index
                ? Colors.grey.withOpacity(0.08)
                : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dataRent.keys.toList()[index],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image(
                  image: AssetImage(dataRent.values.toList()[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ).onTap(function: () {
          watchProvider.chooseHouseType(index);
        });
      },
    );
  }
}
