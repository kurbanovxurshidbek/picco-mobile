import 'package:picco/customer/viewmodel/utils.dart';
import 'package:picco/services/localization_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/favorite/favorite_page.dart';
import 'pages/message/message_page.dart';
import 'pages/profile/profile_page.dart';
import 'pages/search/search_page.dart';

class PagesController extends StatefulWidget {
  const PagesController({Key? key}) : super(key: key);

  @override
  State<PagesController> createState() => _PagesControllerState();
}

class _PagesControllerState extends State<PagesController> {
  int pageIndex = 0;

  var activeIconColor = const Color.fromRGBO(84, 74, 235, 1);

  List<Widget> pages = [
    const SearchPage(),
    const FavoritePage(),
    const MessagePage(),
    const ProfilePage(),
  ];

  callToIndex(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavBarHeight = MediaQuery.of(context).size.height * 0.09;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[pageIndex],
      bottomNavigationBar: _navbar(context, bottomNavBarHeight),
    );
  }

  Container _navbar(BuildContext context, height) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(0, 0), blurRadius: 1),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icons(icon: CupertinoIcons.search, index: 0),
          icons(icon: CupertinoIcons.heart, index: 1),
          Container(
            padding: EdgeInsets.all(height / 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: activeIconColor,
                width: 3,
              ),
            ),
            child: const Icon(CupertinoIcons.repeat),
          ).onTap(function: () {
            final provider = context.read<LocalizationViewModel>();
            provider.changeUser();
            Navigator.pop(context);
          }),
          icons(icon: CupertinoIcons.chat_bubble, index: 2),
          icons(icon: CupertinoIcons.person, index: 3),
        ],
      ),
    );
  }

  icons({icon, index}) {
    return IconButton(
      color: pageIndex == index ? activeIconColor : Colors.black,
      icon: Icon(icon),
      onPressed: () {
        setState(() {
          pageIndex = index;
        });
      },
    );
  }
}
