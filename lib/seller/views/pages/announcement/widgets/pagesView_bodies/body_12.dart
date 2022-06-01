import 'package:flutter/material.dart';

class TwelfthBody extends StatelessWidget {
  const TwelfthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final provider = context.select((AnnouncementProvider provider) => provider);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Image(
              image: AssetImage(
                'assets/images/1.png',
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Pretty House',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 5.0),
          Divider(color: Colors.grey.shade300, thickness: 2),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Выбранные загаловок для обявление: Уютные дом sdsdsdsdsdsd sdsd sd sds d sd',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Icon(Icons.account_circle, size: 50)
            ],
          ),
          const SizedBox(height: 5.0),
          Divider(color: Colors.grey.shade300, thickness: 2),
          const SizedBox(height: 10.0),
          const Center(
            child: Text(
              '● 1 Ванная   ● 1 Кровать   ● 1 Телевизор',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10.0),
          Divider(color: Colors.grey.shade300, thickness: 2),
          const SizedBox(height: 10.0),
          const Text(
            'Описание дома',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10.0),
          Divider(color: Colors.grey.shade300, thickness: 2),
          const SizedBox(height: 10.0),
          const Text(
            'Местоположение',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Chorsu, Chinni bozor, Pdp Academy',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
