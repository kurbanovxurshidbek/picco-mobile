import 'package:picco/customer/models/all_models.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'package:flutter/material.dart';

class TabBarViewBody extends StatefulWidget {
  final List listBlockedTypes;
  final String typeSale;
  final int houseTypeIndex;
  final Function(String) onCallTypeSale;
  final Function(int) onCallIndexHouse;
  final Map<String, String> response;

  const TabBarViewBody({
    Key? key,
    required this.listBlockedTypes,
    required this.typeSale,
    required this.houseTypeIndex,
    required this.onCallTypeSale,
    required this.onCallIndexHouse,
    required this.response,
  }) : super(key: key);

  @override
  State<TabBarViewBody> createState() => _TabBarViewBodyState();
}

class _TabBarViewBodyState extends State<TabBarViewBody> {
  stateColor(int i) {
    if (widget.houseTypeIndex == -1) {
      return false;
    }
    return widget.response["typeSale"] == widget.typeSale &&
        widget.houseTypeIndex == i;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          children: [
            for (int i = 0; i < 3; i++) box(i),
          ],
        ).addExpanded(),
        const SizedBox(height: 10),
        Row(
          children: [
            for (int i = 3; i < 6; i++) box(i),
          ],
        ).addExpanded(),
        const SizedBox(height: 10),
      ],
    );
  }

  Expanded box(int i) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: boxDecoration(i),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppArtList.products(context)[i].logo,
            height: 35,
            color: stateColor(i) ? Colors.white : Colors.black,
          ),
          const SizedBox(height: 6),
          Text(
            AppArtList.products(context)[i].name,
            style: TextStyle(
                fontSize: 12,
                color: stateColor(i) ? Colors.white : Colors.black,),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).onTap(function: () {
      if (widget.listBlockedTypes.contains(i)) return;
      widget.onCallIndexHouse(i);
      widget.onCallTypeSale(widget.typeSale);
    }).addExpanded();
  }

  BoxDecoration boxDecoration(int i) {
    return BoxDecoration(
      color: widget.listBlockedTypes.contains(i)
          ? const Color.fromRGBO(0, 0, 0, 0.12)
          : stateColor(i)
              ? const Color.fromRGBO(113, 105, 249, 1)
              : Colors.white,
      borderRadius: BorderRadius.circular(5),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(172, 172, 172, 0.4),
          offset: Offset(0, 1),
          blurRadius: 3,
        ),
      ],
    );
  }
}
