import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'package:picco/seller/views/pages/announcement/provider.dart';
import 'package:picco/services/log_service.dart';
import 'package:provider/provider.dart';

class SeventhBody extends StatelessWidget {
  const SeventhBody({Key? key}) : super(key: key);
  static const Map<String, String> media = {
    'assets/icons/announcement_page_icons/kitchen_furniture.png':
        'Кухонный мебель',
    'assets/icons/announcement_page_icons/furniture.png': 'Мебель в комнатах',
    'assets/icons/announcement_page_icons/fridge.png': 'Холодильник',
    'assets/icons/announcement_page_icons/washing_machine.png':
        'Стиральная машина',
    'assets/icons/announcement_page_icons/tv.png': 'Телевизор',
    'assets/icons/announcement_page_icons/wifi.png': 'Internet',
    'assets/icons/announcement_page_icons/airconditioning.png': 'Кондитционер',
    'assets/icons/announcement_page_icons/dishwasher.png': 'Посудамойка',
    'assets/icons/announcement_page_icons/bathroom.png': 'Душевая кабина',
    'assets/icons/announcement_page_icons/baby.png': 'Можно с детми',
    'assets/icons/announcement_page_icons/animals.png': 'Можно с животными',
  };

  @override
  Widget build(BuildContext context) {
    final watchProvider = context.watch<AnnouncementProvider>();
    Log.d(watchProvider.listFacilities.toString());
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 15.0,
      ),
      children: [
        const Text(
          'Есть ли у вас особые удобства ?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 20),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: media.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: watchProvider.listFacilities[index]
                      ? Colors.black
                      : Colors.grey.shade300,
                  width: watchProvider.listFacilities[index] ? 1.5 : 1.3,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              // height: 0.2.sh,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        media.values.toList()[index],
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15.h),
                      Image.asset(
                        media.keys.toList()[index],
                        width: 0.06.sw,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ).onTap(function: () {
              watchProvider.updateFacilities(index);
            });
          },
        ),
      ],
    );
  }
}
