import 'package:picco/seller/views/pages/announcement/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EighthBody extends StatelessWidget {
  const EighthBody({Key? key}) : super(key: key);
  static const Map<String, String> media = {
    'assets/icons/announcement_page_icons/photo_upload.png': 'Загрузить фото',
    'assets/icons/announcement_page_icons/photo_take.png': 'Зделать новое фото',
  };

  @override
  Widget build(BuildContext context) {
    final provider =
        context.select((AnnouncementProvider provider) => provider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 80.0,
            decoration: BoxDecoration(
              color: const Color(0xffFBFAFA),
              border: Border.all(color: const Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(10.0),
            ),
            alignment: Alignment.center,
            child: ListTile(
              onTap: () {
                provider.pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
                // provider.navigate(8);
              },
              leading: const Image(
                image: AssetImage(
                    'assets/icons/announcement_page_icons/upload.png'),
                height: 30,
              ),
              title: Text(
                media.values.toList()[0],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 18.0),
          Container(
            height: 80.0,
            decoration: BoxDecoration(
              color: const Color(0xffFBFAFA),
              border: Border.all(color: const Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(5.0),
            ),
            alignment: Alignment.center,
            child: ListTile(
              onTap: () {
                provider.pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              leading: const Icon(
                CupertinoIcons.camera,
                size: 30,
                color: Colors.black,
              ),
              title: Text(
                media.values.toList()[1],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
