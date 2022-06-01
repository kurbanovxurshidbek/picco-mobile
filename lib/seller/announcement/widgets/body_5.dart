import 'package:picco/seller/announcement/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FifthBody extends StatelessWidget {
  const FifthBody({Key? key}) : super(key: key);

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
      padding: const EdgeInsets.all(10.0),
      // padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// Create address text
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          provider.navigate(3);
                        },
                        icon: const Icon(Icons.arrow_back, size: 27),
                      ),
                      const SizedBox(width: 17),
                      const Text(
                        "Введите аддрес",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),

                  ///Search
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueAccent, width: 1),
                          borderRadius: BorderRadius.circular(30)),
                      hintText: "Поиск",
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(
                        Icons.near_me_outlined,
                        size: 25,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  ///Location
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.location_on,
                          size: 30,
                        ),
                      ),
                      const Text(
                        'Выбрать текущее местоположения',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),

                  ///Line
                  const Divider(color: Color(0xFFC4C4C4)),

                  ElevatedButton(
                    style: ButtonStyle(
                      alignment: Alignment.centerRight,
                      backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                      elevation: MaterialStateProperty.resolveWith<double>(
                              (Set<MaterialState> states) => 0.0),
                    ),
                    child: const Text(
                      'Введите аддрес вручную',
                      style: TextStyle(
                        color: Color(0xFF544AEB),
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      provider.navigate(5);
                    },
                  ),
                ],
              )),
          const Divider(
            color: Color(0xff7842D0),
            thickness: 2,
          ),
          MaterialButton(
            minWidth: double.infinity,
            height: 50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: provider.isDisabled
                ? Colors.grey.shade300
                : const Color(0xff4f4e9a),
            splashColor:
            provider.isDisabled ? Colors.transparent : Colors.white54,
            textColor: provider.isDisabled ? Colors.black45 : Colors.white,
            child: const Text(
              'Сохранить',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              provider.isDisabled ? null : Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

