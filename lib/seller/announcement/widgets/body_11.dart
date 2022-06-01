import 'package:picco/seller/announcement/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EleventhBody extends StatelessWidget {
  const EleventhBody({Key? key}) : super(key: key);

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
                    children:[
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
                              child: const Icon(CupertinoIcons.minus, color: Colors.white, size: 30,),
                              onPressed: (){
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
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 30),
                                ),
                              ),),
                            MaterialButton(
                              minWidth: 40,
                              height: 40,
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Icon(Icons.add, color: Colors.white, size: 30,),
                              onPressed: (){
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
                      const Spacer(),
                      const Text(
                        'Жилье похожие на ваше, стоит от \$160 до \$240',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
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
                    provider.navigate(9);
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
                    provider.navigate(11);
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

