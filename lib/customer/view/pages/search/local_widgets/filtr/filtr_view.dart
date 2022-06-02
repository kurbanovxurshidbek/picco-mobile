import 'package:picco/models/all_models.dart';
import 'package:picco/services/localization_service.dart';
import 'package:picco/customer/view/widgets/top_divider_bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'bottom_bar.dart';

class FilterView extends StatefulWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  List<HomeService> Function(BuildContext) homeServiceList = (BuildContext context) => [
    HomeService(name: LocalizationKey.str_wifi.tr(context)),
    HomeService(name: LocalizationKey.str_kitchen.tr(context)),
    HomeService(name: LocalizationKey.str_air_conditioning.tr(context)),
    HomeService(name: LocalizationKey.str_washing_machine.tr(context)),
    HomeService(name: LocalizationKey.str_iron.tr(context))
  ];

  bool checkBoxValue = false;

  static const double _minVal = 1.0;
  static const double _maxVal = 100.0;

  RangeValues sliderValue = const RangeValues(_minVal, _maxVal);

  var heightStatusBar = Hive.box("picco").get("height");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - heightStatusBar,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///line
          Center(child: topDividerBottomSheet()),

          ///close button
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),

          const SizedBox(height: 30),

          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch(
                  accentColor: Colors.blue.shade200,
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mainText(LocalizationKey.str_price_range.tr(context)),

                      ///price number
                      Text(
                        "\$ ${sliderValue.start.floor() * 20}"
                        "- \$ ${sliderValue.end.floor() * 20}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF010047),
                        ),
                      ),
                      const SizedBox(height: 12),

                      ///average price
                      Text(
                        LocalizationKey.str_average_price.tr(context) + ': \$1 200',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 100),

                      ///price liner
                      SliderTheme(
                        data:
                            SliderTheme.of(context).copyWith(trackHeight: 0.1),
                        child: RangeSlider(
                          activeColor: Colors.lightBlueAccent,
                          inactiveColor: Colors.grey.shade900,
                          min: _minVal,
                          max: _maxVal,
                          onChanged: (value) {
                            setState(() {
                              sliderValue = value;
                            });
                          },
                          values: sliderValue,
                        ),
                      ),
                      mainDivider(),
                      mainText(LocalizationKey.str_facilities.tr(context)),
                      for (int i = 0; i < homeServiceList(context).length; i++)
                        itemsList(homeServiceList(context)[i]),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //slider
          const Divider(color: Colors.black),
          //clear all and done buttons
          BottomBarFilter(
            sliderValue: sliderValue,
            homeServiceList: homeServiceList(context),
          ),
        ],
      ),
    );
  }

  mainText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 20),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF4F4E9A),
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  mainDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Divider(
        color: Colors.grey.shade400,
      ),
    );
  }

  itemsList(HomeService homeService) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      onTap: () {
        // print()
        setState(() {
          homeService.isChecked = !homeService.isChecked;
        });
      },
      title: Text(homeService.name),
      trailing: Checkbox(
        value: homeService.isChecked,
        activeColor: const Color(0xFF4F4E9A),
        onChanged: (value) {
          setState(() {
            homeService.isChecked = value ?? false;
          });
        },
      ),
    );
  }
}
