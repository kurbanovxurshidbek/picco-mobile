import 'package:picco/customer/models/all_models.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseCityView extends StatefulWidget {
  final int cityIndex;
  final Function(int) onCallTypeCity;

  const ChooseCityView(
      {Key? key, required this.cityIndex, required this.onCallTypeCity})
      : super(key: key);

  @override
  State<ChooseCityView> createState() => _ChooseCityViewState();
}

class _ChooseCityViewState extends State<ChooseCityView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ImageCityList.list(context).length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => chooseCity(index),
      ),
    );
  }

  chooseCity(int index) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 130.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImageCityList.list(context)[index].image),
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: widget.cityIndex == index
              ? Colors.transparent
              : const Color.fromRGBO(0, 0, 0, 0.61),
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget.cityIndex == index
            ? const SizedBox.shrink()
            : Text(
                ImageCityList.list(context)[index].name,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
      ),
    ).onTap(function: () {
      widget.onCallTypeCity(index);
    });
  }
}
