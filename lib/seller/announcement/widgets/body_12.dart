import 'package:picco/seller/announcement/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TwelfthBody extends StatelessWidget {
  const TwelfthBody({Key? key}) : super(key: key);

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
      padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const Image(
                            image: AssetImage(
                              'assets/images/1.png',
                            ),
                            fit: BoxFit.fitWidth
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text('Pretty House', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      const SizedBox(height: 5.0),
                      Divider(color: Colors.grey.shade300, thickness: 2),
                      const SizedBox(height: 20.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Text('Выбранные загаловок для обявление: Уютные дом sdsdsdsdsdsd sdsd sd sds d sd', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), maxLines: 2, overflow: TextOverflow.ellipsis,),
                                )
                            ),
                            Icon(Icons.account_circle, size: 50,)
                          ]
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
                              fontWeight: FontWeight.bold
                          ),
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
                    ]
                ),
              )
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
                    provider.navigate(10);
                  },
                ),
                MaterialButton(
                  child: const Text(
                    'Сохранить обявление',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  color: const Color(0xff7842D0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  onPressed: () {
                    Navigator.pop(context);
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

