import 'package:picco/customer/models/list_home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snapping_sheet/snapping_sheet.dart';


class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final scrollController = ScrollController();
  bool fullyState = false;

  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      onSheetMoved: (move) {
        if (move.relativeToSnappingPositions == 1) {
          setState(() {
            fullyState = true;
          });
        } else {
          setState(() {
            fullyState = false;
          });
        }
      },
      lockOverflowDrag: true,
      snappingPositions: const [
        SnappingPosition.factor(
          positionFactor: 0.0,
          snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(milliseconds: 300),
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(
          positionFactor: 0.55,
          snappingDuration: Duration(milliseconds: 300),
        ),
        SnappingPosition.factor(
          positionFactor: 1,
          snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(milliseconds: 300),
          grabbingContentOffset: GrabbingContentOffset.bottom,
        ),
      ],
      // #Above the Bottom Navigation Bar
      grabbing: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: fullyState ? Radius.zero : const Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 25,
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
        child: fullyState
            ? const SizedBox.shrink()
            : const BottomSheetTopDivider(),
      ),

      grabbingHeight: 35,
      sheetAbove: null,
      sheetBelow: SnappingSheetContent(
        draggable: true,
        childScrollController: scrollController,
        child: BottomSheetContent(scrollController: scrollController),
      ),
    );
  }
}

class BottomSheetTopDivider extends StatelessWidget {
  const BottomSheetTopDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7),
      height: 4,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  final ScrollController scrollController;
  const BottomSheetContent({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(10, 0.0, 10, 10),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        children: homesData.map((e) => SheetHomeElement(home: e)).toList(),
      ),
    );
  }
}

class SheetHomeElement extends StatelessWidget {
  final HomeModelList home;

  const SheetHomeElement({Key? key, required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///image
        Stack(
          children: [
            Container(
              width: 100.h,
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.4)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Container(
                alignment: Alignment.topRight,
                height: 250,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage(home.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.heart,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Row(
          children: const [
            Icon(
              Icons.favorite_border,
              size: 15,
              color: Colors.grey,
            ),
            SizedBox(width: 5),
            Text(
              '4.86',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              ' (21)',
              style: TextStyle(color: Colors.grey, fontSize: 8),
            ),
          ],
        ),
        SizedBox(height: 0.9.h),
        Row(
          children: const [
            Icon(
              CupertinoIcons.location,
              size: 20,
              color: Colors.grey,
            ),
            Expanded(
              child: Text(
                'Tashkent city, Mirabad district, Yangibitninsnfsdhfksdhflkf sjdkfhlkbsfb hg',
                maxLines: 1,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
      ],
    );
  }
}
