import 'package:picco/models/favorite_model.dart';
import 'package:picco/services/localization_service.dart';
import 'package:picco/customer/view/widgets/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'local_widgets/build_scale.dart';
import 'local_widgets/empty_favorite_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              WidgetUtils.header(LocalizationKey.str_favorite_page_header.tr(context),),
              SizedBox(height: 30.h),
              (favourites.isEmpty)
                  ? const EmptyFavourite()
                  : const BuildScale(),
            ],
          ),
        ),
      ),
    );
  }
}
