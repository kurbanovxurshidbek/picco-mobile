import 'package:picco/customer/view/pages/favorite/favorite_page.dart';
import 'package:picco/customer/view/pages/message/message_page.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'package:picco/seller/views/pages/home/full_home_page.dart';
import 'package:picco/services/localization_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/seller_profile_page.dart';

class SellerPageController extends StatefulWidget {
  const SellerPageController({Key? key}) : super(key: key);

  @override
  State<SellerPageController> createState() => _SellerPageControllerState();
}

class _SellerPageControllerState extends State<SellerPageController> {

  int pageIndex = 0;

  var activeIconColor = const Color.fromRGBO(84, 74, 235, 1);

  List<Widget> pages = [
    const FullHomePage(),
    const FavoritePage(),
    const MessagePage(),
    const SellerProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var bottomNavBarHeight = MediaQuery.of(context).size.height * 0.09;
    return Scaffold(
      body: Stack(
        children: [
          pages[pageIndex],
        ],
      ),
      bottomNavigationBar: _navBar(context, bottomNavBarHeight),
    );
  }
  Container _navBar(BuildContext context, height) {
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
          icons(icon: CupertinoIcons.home, index: 0),
          icons(icon: CupertinoIcons.search, index: 1),
          Consumer<LocalizationViewModel>(
            builder: (context, provider, child) => Container(
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
              provider.changeUser();
            }),
          ),
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
