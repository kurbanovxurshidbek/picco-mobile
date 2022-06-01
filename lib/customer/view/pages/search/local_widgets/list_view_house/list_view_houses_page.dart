import 'package:picco/customer/view/widgets/top_divider_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import 'local_widgets/sheet_content.dart';

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({Key? key}) : super(key: key);

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  final scrollController = ScrollController();
  final snappingSheetController = SnappingSheetController();

  void f() {
    snappingSheetController.snapToPosition(
      const SnappingPosition.factor(
        positionFactor: 0.0,
        snappingCurve: Curves.easeOutExpo,
        snappingDuration: Duration(milliseconds: 300),
        grabbingContentOffset: GrabbingContentOffset.top,
      ),
    );
  }

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
      controller: snappingSheetController,
      lockOverflowDrag: true,
      snappingPositions: const [
        // SnappingPosition.factor(
        //   positionFactor: 0.3,
        //   snappingCurve: Curves.easeOutExpo,
        //   snappingDuration: Duration(milliseconds: 300),
        //   grabbingContentOffset: GrabbingContentOffset.top,
        // ),
        SnappingPosition.factor(
          positionFactor: 0.0,
          snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(milliseconds: 300),
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(
          snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(milliseconds: 300),
          positionFactor: 0.55,
        ),
        SnappingPosition.factor(
          grabbingContentOffset: GrabbingContentOffset.bottom,
          snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(milliseconds: 300),
          positionFactor: 1,
        ),
      ],
      // Above the BNB
      grabbing: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: fullyState ? Radius.zero : Radius.circular(20.r),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 25,
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
        child: fullyState ? const SizedBox.shrink() : topDividerBottomSheet(),
      ),

      grabbingHeight: 35,
      sheetAbove: null,
      sheetBelow: SnappingSheetContent(
        draggable: true,
        childScrollController: scrollController,
        child: SheetContent(scrollController: scrollController),
      ),
    );
  }
}
