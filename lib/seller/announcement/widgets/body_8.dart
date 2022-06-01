import 'package:picco/seller/announcement/provider.dart';
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
    return ChangeNotifierProvider(
      create: (BuildContext context) => AnnouncementProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<AnnouncementProvider>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    alignment: Alignment.center,
                    child: ListTile(
                      onTap: () {
                        provider.navigate(8);
                      },
                      leading: const Icon(Icons.cloud_upload, size: 30),
                      title: Text(
                        media.values.toList()[0],
                        style: const TextStyle(fontSize: 20),
                      ),
                    )),
                const SizedBox(height: 18.0),
                Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    alignment: Alignment.center,
                    child: ListTile(
                      onTap: () {
                        provider.navigate(8);
                      },
                      leading: const Icon(Icons.camera_alt, size: 30),
                      title: Text(
                        media.values.toList()[1],
                        style: const TextStyle(fontSize: 20),
                      ),
                    )),
              ],
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
                    provider.navigate(6);
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
                    provider.navigate(8);
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

