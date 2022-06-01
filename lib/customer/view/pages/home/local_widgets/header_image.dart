import 'package:picco/services/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderImgHomePage extends StatelessWidget {
  const HeaderImgHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
          colors: [
            Color.fromRGBO(86, 85, 158, 1),
            Color.fromRGBO(86, 85, 158, 0.82),
            Color.fromRGBO(86, 85, 158, 0.45),
            Color.fromRGBO(86, 85, 158, 0),
            Color.fromRGBO(86, 85, 158, 0.19)
          ],
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(height: 0),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/header_img.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 8.0, top: 30),
            width: 310.w,
            child: Text(
              LocalizationKey.str_intro.tr(context),
              style: const TextStyle(color: Colors.white, fontSize: 23),
            ),
          ),
        ],
      ),
    );
  }
}
