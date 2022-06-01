import 'package:picco/seller/views/pages/announcement/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EleventhBody extends StatelessWidget {
  const EleventhBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        context.select((AnnouncementProvider provider) => provider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 10.0),
      child: Column(
        children: [
          // #Set price
          SizedBox(
            height: 70,
            child: Row(
              children: [
                MaterialButton(
                  minWidth: 40,
                  height: 40,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Icon(
                    CupertinoIcons.minus,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    provider.updatePrice(false);
                  },
                ),
                Expanded(
                  child: Container(
                    height: 70,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      '\$${provider.price}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 30),
                    ),
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  height: 40,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    provider.updatePrice(true);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Center(
            child: Container(
              height: 40,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const Text(
                'За Месяц',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Жилье похожие на ваше, стоит от \$160 до \$240',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
