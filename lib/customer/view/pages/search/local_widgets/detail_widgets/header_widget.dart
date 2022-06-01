import 'package:picco/customer/view/pages/search/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailModel = DetailPageInherit.read(context)!.detailModel;
    final pageController = detailModel.pageController;
    final homeImages = detailModel.homeImages;

    return SizedBox(
      height: 200.h,
      width: 100.sw,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // images
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            itemCount: homeImages.length,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                homeImages[index],
                fit: BoxFit.cover,
              );
            },
            onPageChanged: detailModel.changedPage,
          ),

          Padding(
            padding: EdgeInsets.all(6.w),
            child: Column(
              children: [
                // top iconButtons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _IconButtons(
                      color: Colors.white,
                      icon: Icons.arrow_back,
                      onPressed: () => detailModel.goBack(context),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        _IconButtons(
                          color: Colors.white,
                          icon: Icons.share_outlined,
                          onPressed: () => detailModel.showBottomSheet(context),
                        ),
                        _IconButtons(
                          color: Colors.white,
                          icon: Icons.favorite_border_rounded,
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 45.h),

                // images arrow button
                const _ImageChangeControlWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageChangeControlWidget extends StatelessWidget {
  const _ImageChangeControlWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailModel = DetailPageInherit.watch(context)!.detailModel;
    final homeImages = detailModel.homeImages;
    final currentPage = detailModel.currentPage;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        currentPage > 0
            ? _IconButtons(
          onPressed: detailModel.moveLeft,
          color: Colors.transparent,
          icon: Icons.arrow_back_ios_outlined,
        )
            : const SizedBox.shrink(),
        currentPage < homeImages.length - 1
            ? _IconButtons(
          onPressed: detailModel.moveRight,
          color: Colors.transparent,
          icon: Icons.arrow_forward_ios,
        )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class _IconButtons extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final Color color;

  const _IconButtons({
    Key? key,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: color,
        shape: const CircleBorder(),
      ),
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.black,
        size: 18.sp,
      ),
    );
  }
}
