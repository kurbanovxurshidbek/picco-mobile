import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picco/customer/view/pages/search/search_page_provider.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'package:picco/models/home_model.dart';
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
    final provider = SearchPageInherit.read(context)!;

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

        if (move.relativeToSnappingPositions == 0.0) {
          provider.zoomIn();
          // setState(() {});
        }
      },
      initialSnappingPosition: const SnappingPosition.factor(
        positionFactor: 0.4,
        snappingCurve: Curves.easeOutExpo,
        snappingDuration: Duration(milliseconds: 300),
        grabbingContentOffset: GrabbingContentOffset.top,
      ),
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
    final provider = SearchPageInherit.read(context)!;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(10, 0.0, 10, 10),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        controller: scrollController,
        itemCount: provider.homes.length,
        itemBuilder: (context, index) => SheetHomeElement(
          home: provider.homes[index],
        ),
      ),
    );
  }
}

class SheetHomeElement extends StatelessWidget {
  final HomeModel home;

  const SheetHomeElement({Key? key, required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.4.sh,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topRight,
                height: 0.3.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  // image: DecorationImage(
                  //   image: AssetImage(home.houseImages.first),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.heart,
                    color: Colors.white,
                  ),
                ),
              ).putElevation(
                elevation: 6.0,
                radius: 10.0,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${home.city} city',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "\$${home.price}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.location,
                          size: 18,
                        ),
                        Text(
                          '${home.roomsCount} '
                              '${int.tryParse(home.roomsCount)! > 1 ? 'rooms' : 'room'}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '${home.houseSize}m',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 6.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
