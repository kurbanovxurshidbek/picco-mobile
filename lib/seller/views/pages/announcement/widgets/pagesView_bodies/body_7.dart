import 'package:flutter/material.dart';

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
    // final provider = context.select((AnnouncementProvider provider) => provider);

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      children: [
        const Text(
          'Есть ли у вас особые удобства ?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: media.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: (){
                // TODO: FIll the object's fields based on the index...
                print('Pressed $index => ${media.values.toList()[index]}');
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      media.values.toList()[index],
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 20.0),
                    Image.asset(
                      media.keys.toList()[index],
                      height: 35,
                      width: 35,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
