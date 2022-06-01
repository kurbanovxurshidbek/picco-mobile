import 'package:flutter/material.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'package:picco/seller/views/pages/announcement/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picco/seller/views/pages/announcement/widgets/pagesView_bodies/body_1.dart';
import 'package:picco/seller/views/pages/announcement/widgets/pagesView_bodies/body_2.dart';
import 'package:picco/seller/views/pages/announcement/widgets/pagesView_bodies/body_3.dart';
import 'package:picco/seller/views/pages/announcement/widgets/pagesView_bodies/body_4.dart';
import 'package:picco/seller/views/pages/announcement/widgets/pagesView_bodies/body_7.dart';
import 'package:picco/seller/views/pages/announcement/widgets/pagesView_bodies/body_8.dart';
import 'package:picco/seller/views/pages/announcement/widgets/pagesView_bodies/body_9.dart';
import 'package:picco/seller/views/pages/announcement/widgets/pagesView_bodies/body_10.dart';
import 'package:picco/seller/views/pages/announcement/widgets/pagesView_bodies/body_11.dart';
import 'package:picco/seller/views/pages/announcement/widgets/pagesView_bodies/body_12.dart';
import 'package:picco/seller/views/pages/announcement/widgets/titles_and_buttons/titles.dart';
import 'package:picco/seller/views/pages/announcement/widgets/titles_and_buttons/start_button.dart';
import 'package:picco/seller/views/pages/announcement/widgets/titles_and_buttons/back_next_button.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({Key? key}) : super(key: key);

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Tween<double> tween;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    tween = Tween(begin: 0.0, end: 1.0);
    opacityAnimation = tween.animate(controller);
    controller.forward();

    super.initState();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AnnouncementProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<AnnouncementProvider>();
    final heights =
        context.select((AnnouncementProvider provider) => provider.heights);
    final currentPageIndex = context
        .select((AnnouncementProvider provider) => provider.currentPageIndex);

    return Scaffold(
      resizeToAvoidBottomInset: provider.currentPageIndex == 9,
      extendBodyBehindAppBar: true,
      appBar: provider.currentPageIndex == 10
          ? null
          : AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: Padding(
                padding: const EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ).onTap(
                  function: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    child: const Text(
                      'Помощь',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 0.0,
                    color: Colors.grey.withOpacity(0.3),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1, -1),
            end: Alignment(2.7, 0),
            colors: [
              Color(0xff7842D0),
              Color(0xffE41547),
              Color(0xffD82490),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (provider.headers[provider.currentPageIndex].isNotEmpty)
              Expanded(
                child: Container(
                  // height: 250.h,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.bottomLeft,
                  child: FadeTransition(
                    opacity: opacityAnimation,
                    child: const Titles(),
                  ),
                ),
              ),
            AnimatedContainer(
              height: heights[currentPageIndex],
              width: 1.sw,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutSine,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
              child: PageView(
                controller: provider.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  FirstBody(), //0
                  SecondBody(), //1
                  ThirdBody(), //2
                  FourthBody(), //3
                  SeventhBody(), //4
                  EighthBody(), //5
                  NinthBody(), //6
                  TenthBody(), //7
                  EleventhBody(), //8
                  TwelfthBody(), //9
                ],
                onPageChanged: (int index) {
                  provider.updatePageIndex(index);
                },
              ),
            ),
            if (currentPageIndex == 0) StartButton(controller: controller),
            // if (currentPageIndex == 4)
            //   SaveButton(controller: controller),
            if (currentPageIndex > 0 && currentPageIndex < 10)
              NextBackButtons(controller: controller),
          ],
        ),
      ),
    );
  }
}
