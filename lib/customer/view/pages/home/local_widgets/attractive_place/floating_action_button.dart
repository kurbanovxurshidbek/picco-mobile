import 'package:picco/customer/view/controller_pages.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'package:picco/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingActionButtonHomePage extends StatelessWidget {
  final Map<String, String> response;

  const FloatingActionButtonHomePage({Key? key, required this.response})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 800),
      sizeCurve: Curves.easeOutCirc,
      firstCurve: Curves.easeOutExpo,
      secondCurve: Curves.easeOutExpo,
      firstChild: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    response["typeHouse"]!,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  Text(response["typeCity"]!),
                ],
              ),
              const SizedBox(width: 20),
              Image.asset(
                'assets/icons/home_page_icons/home_page_search_icon.png',
                width: 0.06.sw,
              ),
            ],
          ),
        )
            .putElevationOffset(
          radius: 15.0,
          elevation: 5.0,
          x: 0.0,
          y: 0.0,
        )
            .onTap(function: () {
          HiveService.storeString("city", response["typeCity"]!);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PagesController()));
        }),
      ),
      secondChild: const SizedBox.shrink(),
      crossFadeState:
          response["typeHouse"]!.isNotEmpty && response["typeCity"]!.isNotEmpty
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
    );
  }
}
