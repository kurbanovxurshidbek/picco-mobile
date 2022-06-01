import 'package:picco/customer/models/home_model_map.dart';
import 'package:picco/customer/models/similar_ads_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'local_widgets/detail_widgets/body_widget.dart';
import 'local_widgets/detail_widgets/header_widget.dart';

class DetailPageModel extends ChangeNotifier {
  final pageController = PageController();
  late List<String> homeImages;
  int currentPage = 0;

  void moveLeft() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    }
  }

  void moveRight() {
    if (currentPage < homeImages.length) {
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    }
  }

  void changedPage(int index) {
    currentPage = index;
    notifyListeners();
  }

  void likeButton(SimilarAdsModel simAds) {
    simAds.liked = !simAds.liked;
    notifyListeners();
  }

  void goHomeLocation(BuildContext context, {required Geo geo}) {
    Navigator.pop(context, geo);
  }

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const _ShareBottomSheet();
      },
    );
  }
}

class DetailPageInherit extends InheritedNotifier {
  final DetailPageModel detailModel;

  const DetailPageInherit({
    Key? key,
    required this.detailModel,
    required Widget child,
  }) : super(key: key, notifier: detailModel, child: child);

  static DetailPageInherit? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DetailPageInherit>();
  }

  static DetailPageInherit? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<DetailPageInherit>()
        ?.widget;
    return widget is DetailPageInherit ? widget : null;
  }
}

class DetailPage extends StatefulWidget {
  final HomeModelMap homeModelMap;

  const DetailPage({
    Key? key,
    required this.homeModelMap,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var detailModel = DetailPageModel();

  @override
  void initState() {
    super.initState();
    detailModel.homeImages = widget.homeModelMap.images;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DetailPageInherit(
          detailModel: detailModel,
          child: ListView(
            children: const [
              DetailHeader(),
              DetailBody(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            color: Colors.grey,
            height: 2,
            thickness: 0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Button(
                text: 'Send a message',
                onPressed: () {},
              ),
              _Button(
                text: 'Make a call',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const _Button({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.0.h,
        horizontal: 4.w,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          minimumSize: Size(160.w, 40.h),
          primary: const Color(0xff4F4E9A),
        ),
        onPressed: () {},
        child: Text(
          text,
        ),
      ),
    );
  }
}

class _ShareBottomSheet extends StatelessWidget {
  const _ShareBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Divider(
            color: Colors.black,
            indent: 150.w,
            endIndent: 150.w,
            height: 4,
            thickness: 3,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
              Text(
                "Share",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          _ShareButton(
            onPressed: () {},
            text: "Telegram",
            icon: Icons.telegram,
          ),
          _ShareButton(
            onPressed: () {},
            text: "Telegram",
            icon: Icons.telegram,
          ),
          _ShareButton(
            onPressed: () {},
            text: "Telegram",
            icon: Icons.telegram,
          ),_ShareButton(
            onPressed: () {},
            text: "Telegram",
            icon: Icons.telegram,
          ),
        ],
      ),
    );
  }
}

class _ShareButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final IconData icon;

  const _ShareButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.h),
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 5.h,
        bottom: 5.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListTile(
        onTap: onPressed,
        title: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          icon,
          size: 25.w,
        ),
      ),
    );
  }
}



