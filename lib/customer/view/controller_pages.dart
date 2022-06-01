import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'pages/favorite/favorite_page.dart';
import 'pages/message/message_page.dart';
import 'pages/profile/profile_page.dart';
import 'pages/search/search_page.dart';
import 'pages/switch/switch_page.dart';

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
    const SwitchPage(),
    const MessagePage(),
    const ProfilePage(),
  ];

  callToIndex(index){
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
            setState(() {
              pageIndex = 2;
            });
          }),
          icons(icon: CupertinoIcons.chat_bubble, index: 3),
          icons(icon: CupertinoIcons.person, index: 4),
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
