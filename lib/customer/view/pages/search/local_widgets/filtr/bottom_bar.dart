import 'package:picco/models/all_models.dart';
import 'package:picco/services/localization_service.dart';
import 'package:flutter/material.dart';

class BottomBarFilter extends StatelessWidget {
  final RangeValues sliderValue;
  final List<HomeService> homeServiceList;

  const BottomBarFilter({
    Key? key,
    required this.sliderValue,
    required this.homeServiceList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _minValue = sliderValue.start.floor() * 20;
    int _maxValue = sliderValue.end.floor() * 20;

    Map<String, dynamic> response = {
      "price": {"\nminValue : $_minValue,\nmaxValue :  $_maxValue\n"},
      "\nfecilities": [
       homeServiceList.where((element) => element.isChecked).map((e) => e.name)
      ],
    };

    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              LocalizationKey.str_clear_all.tr(context),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              print(response);
            },
            color: const Color.fromRGBO(79, 78, 154, 1),
            minWidth: 107,
            height: 47,
            child: Text(
              LocalizationKey.str_done.tr(context),
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
