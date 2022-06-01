import 'package:picco/seller/announcement/provider.dart';
import 'package:picco/seller/announcement/widgets/body_1.dart';
import 'package:picco/seller/announcement/widgets/body_10.dart';
import 'package:picco/seller/announcement/widgets/body_11.dart';
import 'package:picco/seller/announcement/widgets/body_12.dart';
import 'package:picco/seller/announcement/widgets/body_2.dart';
import 'package:picco/seller/announcement/widgets/body_3.dart';
import 'package:picco/seller/announcement/widgets/body_4.dart';
import 'package:picco/seller/announcement/widgets/body_5.dart';
import 'package:picco/seller/announcement/widgets/body_6.dart';
import 'package:picco/seller/announcement/widgets/body_7.dart';
import 'package:picco/seller/announcement/widgets/body_8.dart';
import 'package:picco/seller/announcement/widgets/body_9.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({Key? key}) : super(key: key);

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> with SingleTickerProviderStateMixin {
  final model = AnnouncementProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: model,
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<AnnouncementProvider>();

    return Scaffold(
      resizeToAvoidBottomInset: provider.currentPageIndex == 9,
      extendBodyBehindAppBar: true,
      appBar: provider.currentPageIndex == 11
          ? null
          : AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                splashRadius: 1,
                icon: const Icon(
                  Icons.cancel,
                  color: Color.fromRGBO(187, 183, 183, 0.6),
                  size: 34,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    child: Text(
                      'Помощь',
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 0.0,
                    color: const Color.fromRGBO(187, 183, 183, 0.6),
                    onPressed: () {},
                  ),
                )
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
            if (!provider.isExpanded)
              Expanded(
                child: Container(
                  // height: 250.h,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.bottomLeft,
                  child: const _Titles(),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                height: provider.heights[provider.currentPageIndex],
                width: 1.sw,
                alignment: Alignment.bottomCenter,
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
                  children: const [
                    FirstBody(),
                    SecondBody(),
                    ThirdBody(),
                    FourthBody(),
                    FifthBody(),
                    SixthBody(),
                    SeventhBody(),
                    EighthBody(),
                    NinthBody(),
                    TenthBody(),
                    EleventhBody(),
                    TwelfthBody(),
                  ],
                  onPageChanged: (int index) {
                    provider.navigate(index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Titles extends StatelessWidget {
  const _Titles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.select((AnnouncementProvider provider) => provider);

    return AnimatedOpacity(
      opacity: 1,
      duration: const Duration(seconds: 1),
      child: Text(
        provider.headers[provider.currentPageIndex],
        style: TextStyle(
          color: Colors.white,
          fontSize: 26.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
