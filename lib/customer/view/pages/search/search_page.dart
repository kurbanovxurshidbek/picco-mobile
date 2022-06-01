import 'dart:typed_data';

import 'package:picco/customer/models/city_default_location_model.dart';
import 'package:picco/customer/models/home_location_model.dart';
import 'package:picco/customer/models/home_model_map.dart';
import 'package:picco/customer/models/place_model.dart';
import 'package:picco/customer/view/pages/search/local_widgets/list_view_house/list_view_houses_page.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'package:picco/services/hive_service.dart';
import 'package:picco/services/location_service.dart';
import 'package:picco/services/log_service.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'local_widgets/filtr/filtr_view.dart';
import 'local_widgets/map_view_houses/map_widgets/flutter_widget_to_image.dart';
import 'local_widgets/map_view_houses/map_widgets/home_snackbar_element.dart';
import 'local_widgets/map_view_houses/map_widgets/marker_template_widget.dart';

class SearchPageModel extends ChangeNotifier {}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with WidgetsBindingObserver {
  final textEditingController =
      TextEditingController(text: HiveService.loadString("city"));
  PlaceModel? placeModel;
  final focusNode = FocusNode();
  bool showAutoFeel = false;

  void _input(String input) async {
    var response = await LocationService.GET(
      LocationService.API_PLACE,
      LocationService.paramsSearch(text: input),
    );

    if (response != null) {
      setState(() {
        showAutoFeel = true;
        placeModel = placeModelFromJson(response);
      });
    }
  }

  Future<Location?> onSelectedLocation({required String location}) async {
    setState(() {
      textEditingController.text = location;
      focusNode.unfocus();
      showAutoFeel = false;
    });

    late List<Location> locations;

    try {
      locations = await locationFromAddress(location);

      Log.d('${locations.first.latitude} ${locations.first.longitude}');

      return locations.first;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location not found. Try again!'),
        ),
      );
    }

    return null;
  }

  // map
  Set<Marker> markers = {};
  Set<Marker> markersWhiteNotTapped = {};
  Set<Marker> markersBlackTapped = {};
  List<Widget> bottomHomeElement = [];
  late GoogleMapController mapController;

  void onInit(BuildContext context) async {
    _generateMarkers(context);
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    await _setMapStyle(mapController);
    await _animateCameraToUserCurrentPosition(mapController);
  }

  /// * -- Camera control
  Future<void> _animateCameraToUserCurrentPosition(
    GoogleMapController mapController, {
    double zoom = 14.2,
  }) async {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: await _getUserCurrentPosition(),
          zoom: zoom,
        ),
      ),
    );
  }

  Future<LatLng> _getUserCurrentPosition() async {
    final position = await Permission.getGeoLocationPosition();
    return LatLng(position.latitude, position.longitude);
  }

  Future<void> _setMapStyle(GoogleMapController mapController) async {
    String mapStyle =
        await rootBundle.loadString('assets/map_style/picco_map.json');
    mapController.setMapStyle(mapStyle);
  }

  CameraPosition _initialCamPosition() {
    final position = getCityInPosition(
      textEditingController.text.trim().toString(),
      context,
    );

    return CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 12.8,
    );
  }

  // final _initialCamPosition = const CameraPosition(
  //   target: LatLng(41.31003385680767, 69.24159251153469),
  //   zoom: 12.8,
  // );

  Future<void> searchCameraMove(
    GoogleMapController mapController, {
    double zoom = 14.2,
  }) async {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: const LatLng(1, 1),
          zoom: zoom,
        ),
      ),
    );
  }

  /// * -- Camera control

  /// * -- Marker control
  void _generateMarkers(BuildContext context) {
    MarkerGenerator(_markerWidgetsNotTapped(), (bitmaps) {
      markers = _mapBitmapsToMarkers(bitmaps);
      markersWhiteNotTapped.addAll(markers);
      setState(() {});
    }).generate(context);

    MarkerGenerator(_markerWidgetsTapped(), (bitmaps) {
      markersBlackTapped = _mapBitmapsToMarkers(bitmaps);
    }).generate(context);
  }

  List<Widget> _markerWidgetsTapped() {
    return homes
        .map(
          (home) => MarkerTemplateWidget(
            name: home.prise,
            tapped: true,
          ),
        )
        .toList();
  }

  List<Widget> _markerWidgetsNotTapped() {
    return homes
        .map(
          (home) => MarkerTemplateWidget(
            name: home.prise,
            tapped: false,
          ),
        )
        .toList();
  }

  Set<Marker> _mapBitmapsToMarkers(List<Uint8List> bitmaps) {
    Set<Marker> markersList = {};

    for (int i = 0; i < bitmaps.length; i++) {
      final home = homes[i];
      final bitmap = bitmaps[i];

      final marker = Marker(
        markerId: MarkerId(home.id.toString()),
        position: LatLng(home.geo.latitude, home.geo.longitude),
        icon: BitmapDescriptor.fromBytes(bitmap),
        onTap: () async {
          updateUIMarkers(home);
          bottomHouseWidgetUpdate(home);
        },
      );

      markersList.add(marker);
    }
    return markersList;
  }

  void updateUIMarkers(HomeLocationModel home) {
    markers
      ..clear()
      ..addAll(
        {
          markersBlackTapped.firstWhere(
            (element) => home.id.toString() == element.markerId.value,
          ),
          ...markersWhiteNotTapped.where(
            (element) => home.id.toString() != element.markerId.value,
          ),
        },
      );
  }

  void bottomHouseWidgetUpdate(HomeLocationModel home) {
    bottomHomeElement
      ..clear()
      ..add(
        HomeSnackBarElement(
          mapController: mapController,
          homeModel: homeModels.firstWhere(
            (element) => home.id == element.id,
          ),
        ),
      );
    setState(() {});
  }

  void bottomHouseWidgetClear() {
    markers
      ..clear()
      ..addAll(markersWhiteNotTapped);

    setState(() {
      bottomHomeElement.clear();
    });
  }

  /// * -- Marker control

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      mapController.setMapStyle('[]');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (HiveService.box.get("height") == null) {
      HiveService.box.put(
        "height",
        MediaQuery.of(context).padding.top,
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 60.h,
        titleSpacing: 0,
        title: SizedBox(
          height: AppBar().preferredSize.height,
          child: Material(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            shadowColor: Colors.grey,
            child: TextField(
              focusNode: focusNode,
              controller: textEditingController,
              onChanged: _input,
              onEditingComplete: () {
                onSelectedLocation(
                  location: textEditingController.text.trim().toString(),
                );
              },
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                prefixIcon: const Icon(CupertinoIcons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const FilterView(),
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
              );
            },
            icon: const Icon(CupertinoIcons.slider_horizontal_3),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            markers: markers,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            compassEnabled: false,
            buildingsEnabled: false,
            initialCameraPosition: _initialCamPosition(),
            onTap: (latLng) {
              bottomHouseWidgetClear();
              Log.e('lang: ${latLng.latitude} long: ${latLng.longitude}');
            },
            onCameraMoveStarted: () {},
          ),
          ...bottomHomeElement,
          const BottomSheetPage(),
          Padding(
            padding: EdgeInsets.only(bottom: 120.h),
            child: FloatingActionButton(
              elevation: 3,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.gps_not_fixed_rounded,
                color: Colors.grey,
                size: 26,
              ),
              onPressed: () async {
                // await _animateCameraToUserCurrentPosition(
                //   mapController,
                //   zoom: 18,
                // );
              },
            ),
          ),
          (showAutoFeel)
              ? Container(
                  height: 200.h,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 90.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: ListView.separated(
                    padding: EdgeInsets.all(2.0.h),
                    itemCount: placeModel!.predictions.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(height: 2.h),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            '${placeModel!.predictions[index].description}'),
                        onTap: () {
                          Log.d(
                              '${placeModel!.predictions[index].description}');
                          onSelectedLocation(
                            location: placeModel!
                                    .predictions[index].description ??
                                textEditingController.text.trim().toString(),
                          );
                        },
                      );
                    },
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
