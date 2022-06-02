import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../provider.dart';
import '../titles_and_buttons/save_button.dart';

class FourthBody extends StatelessWidget {
  const FourthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        context.select((AnnouncementProvider provider) => provider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                ),
                child: Lottie.asset(
                  "assets/lottie/location.json",
                  width: 0.6.sw,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: MaterialButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.only(
                                top: AppBar().preferredSize.height),
                            child: DraggableScrollableSheet(
                              initialChildSize: 1,
                              maxChildSize: 1,
                              builder: (_, controller) {
                                return Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.0)),
                                  ),
                                  child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 15,
                                    ),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.arrow_back,
                                                size: 27),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          const SizedBox(width: 10),
                                          const Text(
                                            'Введите аддрес',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 35.0.h),
                                      _boxGetCity(provider, "Область"),
                                      const SizedBox(height: 12.0),
                                      _boxGetCity(provider, "Район/Город"),
                                      const SizedBox(height: 15.0),
                                      _boxGetCity(provider, "Улица"),
                                      const SizedBox(height: 20.0),
                                      const Divider(),
                                      const SizedBox(height: 20.0),
                                      const Text(
                                        'Точное место',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),
                                      const Text(
                                        'Вы можете показать, где именно находится жилье',
                                      ),
                                      const SizedBox(height: 20.0),
                                      Container(
                                        height: 0.3.sh,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        child: Image.asset(
                                          "assets/icons/img.png",
                                          height: 0.1.sw,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 30),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "Текущее местоположение",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SaveButton(provider: provider),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    color: Colors.white,
                    minWidth: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: const StadiumBorder(),
                    child: Row(
                      children: const [
                        SizedBox(width: 15),
                        Icon(CupertinoIcons.location),
                        SizedBox(width: 10),
                        Text(
                          "Введите адрес",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  SizedBox _boxGetCity(AnnouncementProvider provider, String label) {
    return SizedBox(
      width: 1.sw,
      child: DropdownButtonFormField<String>(
        icon: const Icon(Icons.keyboard_arrow_down),
        iconEnabledColor: Colors.black54,
        iconDisabledColor: Colors.grey,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(15.0, 14.0, 15.0, 14.0),
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 14,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey)),
        ),
        value: provider.selectedOption,
        items: provider.options
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(
                  e,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            )
            .toList(),
        onChanged: (option) {
          provider.chooseOption(option!);
        },
      ),
    );
  }
}
