import 'package:picco/seller/announcement/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class ThirdBody extends StatelessWidget {
  const ThirdBody({Key? key}) : super(key: key);
  static const Map<String, String> data = {
    'Дом / квартира': 'assets/images/1.png',
    'Здание для бизнеса': 'assets/images/2.png',
    'Новостройки': 'assets/images/3.png',
    'Коттедж': 'assets/images/4.png',
    'Гостиницы': 'assets/images/5.png',
    'Загородные дома': 'assets/images/6.png',
  };

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AnnouncementProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<AnnouncementProvider>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: data.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20.h);
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 76,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.keys.toList()[index],
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18.sp),
                        ),
                        Container(
                          height: 76,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image(
                            image: AssetImage(
                              data.values.toList()[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ));
              },
            ),
          ),
          const Divider(
            color: Color(0xff7842D0),
            thickness: 2,
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  child: const Text(
                    'Назад',
                    style: TextStyle(fontSize: 18),
                  ),
                  color: Colors.transparent,
                  elevation: 0.0,
                  onPressed: () {
                    provider.navigate(1);
                  },
                ),
                MaterialButton(
                  child: const Text(
                    'Далее',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  color: const Color(0xff7842D0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  onPressed: () {
                    provider.navigate(3);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

