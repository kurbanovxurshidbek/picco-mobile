import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class BottomSheetCustomWidget extends StatefulWidget {
  final List<bool> sheetFactories;
  final bool isScrollable;
  final EdgeInsetsGeometry padding;
  final Widget body;

  const BottomSheetCustomWidget({
    Key? key,
    required this.sheetFactories,
    required this.isScrollable,
    required this.padding,
    required this.body,
  }) : super(key: key);

  @override
  State<BottomSheetCustomWidget> createState() =>
      _BottomSheetCustomWidgetState();
}

class _BottomSheetCustomWidgetState extends State<BottomSheetCustomWidget> {
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
      snappingPositions: [
        widget.sheetFactories.first
            ? const SnappingPosition.factor(
                positionFactor: 0.0,
                snappingCurve: Curves.easeOutExpo,
                snappingDuration: Duration(milliseconds: 300),
                grabbingContentOffset: GrabbingContentOffset.top,
              )
            : widget.sheetFactories[1]
                ? const SnappingPosition.factor(
                    positionFactor: 0.94,
                    snappingDuration: Duration(milliseconds: 300),
                  )
                : widget.sheetFactories[2]
                    ? const SnappingPosition.factor(
                        positionFactor: 0.94,
                        snappingDuration: Duration(milliseconds: 300),
                      )
                    : const SnappingPosition.factor(
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
        child: fullyState || widget.sheetFactories.contains(false)
            ? const SizedBox.shrink()
            : const BottomSheetTopDivider(),
      ),

      grabbingHeight: 35,
      sheetAbove: null,
      sheetBelow: SnappingSheetContent(
        draggable: !widget.sheetFactories.contains(false),
        childScrollController: scrollController,
        child: BottomSheetContent(
          scrollController: scrollController,
          isScrollable: widget.isScrollable,
          padding: widget.padding,
          body: widget.body,
        ),
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
  final Widget body;
  final bool isScrollable;
  final EdgeInsetsGeometry padding;

  const BottomSheetContent({
    Key? key,
    required this.scrollController,
    required this.isScrollable,
    required this.padding,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: padding,
        // padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: body
        // isScrollable
        //   ? ListView(
        //       physics: const BouncingScrollPhysics(),
        //       padding: EdgeInsets.zero,
        //       controller: scrollController,
        //       children: [body],
        //     )
        //   : body,
        );
  }
}
