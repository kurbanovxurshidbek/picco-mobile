import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarkerTemplateWidget extends StatelessWidget {
  final String name;
  final bool tapped;

  const MarkerTemplateWidget({
    Key? key,
    required this.name,
    required this.tapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: Colors.black, width: 0.5.w),
        color: tapped ? Colors.red : Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w800,
          color: tapped ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
