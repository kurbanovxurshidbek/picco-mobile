import 'package:picco/customer/models/all_models.dart';
import 'package:picco/services/localization_service.dart';
import 'package:flutter/material.dart';

import 'local_widgets/app_bar.dart';
import 'local_widgets/attractive_place/attraction_places_view.dart';
import 'local_widgets/attractive_place/floating_action_button.dart';
import 'local_widgets/choose_city_view.dart';
import 'local_widgets/header_image.dart';
import 'local_widgets/tab_bar_indicator.dart';
import 'local_widgets/tab_bar_view_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  final keyOne = GlobalKey();
  final keyTwo = GlobalKey();
  final keyThree = GlobalKey();

  int houseTypeIndex = -1;
  int cityTypeIndex = -1;

  Map<String, String> response = {
    "typeSale": "",
    "typeHouse": "",
    "typeCity": "",
  };

  callToSaleType(String responseTypeSale) {
    setState(() {
      response["typeSale"] = responseTypeSale;
    });
  }

  callToHouseType(int index) {
    setState(() {
      houseTypeIndex = index;
      response["typeHouse"] = AppArtList.products(context)[index].name;
    });
  }

  callToCityType(int index) {
    setState(() {
      cityTypeIndex = index;
      response["typeCity"] = ImageCityList.list(context)[index].name;
    });
  }

  @override
  void initState() {
    // WidgetsBinding.instance!.addPostFrameCallback(
    //   (timeStamp) => ShowCaseWidget.of(context)!.startShowCase([
    //     // keyOne,
    //     // keyTwo,
    //     // keyThree,
    //   ]),
    // );
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ListView(
            children: [
              ///header img
              const HeaderImgHomePage(),

              ///tab bar
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: LocalizationKey.str_rent_houses.tr(context)),
                  Tab(text: LocalizationKey.str_buy_houses.tr(context)),
                ],
                indicator: const MD2Indicator(
                  indicatorSize: MD2IndicatorSize.normal,
                  indicatorHeight: 3.0,
                  indicatorColor: Color.fromRGBO(113, 105, 249, 1),
                ),
                unselectedLabelColor: Colors.black,
                labelColor: const Color.fromRGBO(113, 105, 249, 2),
              ),

              ///tab bar view
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TabBarView(
                  controller: _tabController,
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    TabBarViewBody(
                      listBlockedTypes: const [],
                      typeSale: "Rent",
                      houseTypeIndex: houseTypeIndex,
                      onCallTypeSale: callToSaleType,
                      onCallIndexHouse: callToHouseType,
                      response: response,
                    ),
                    TabBarViewBody(
                      listBlockedTypes: const [3, 5],
                      typeSale: "Buy",
                      houseTypeIndex: houseTypeIndex,
                      onCallTypeSale: callToSaleType,
                      onCallIndexHouse: callToHouseType,
                      response: response,
                    ),
                  ],
                ),
              ),

              ///choosing city
              categoryTextWithPadding("Choose a city"),

              ///city list
              ChooseCityView(
                cityIndex: cityTypeIndex,
                onCallTypeCity: callToCityType,
              ),

              ///looking attraction places
              categoryTextWithPadding("Attraction places"),

              const SizedBox(height: 20),

              ///attraction places list
              const AttractionPlaceView(),

              const SizedBox(height: 30),
            ],
          ),
          FloatingActionButtonHomePage(response: response),
        ],
      ),
    );
  }
}
