import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'package:picco/models/city_default_location_model.dart';
import 'package:picco/models/home_model.dart';
import 'package:picco/models/place_model.dart';
import 'package:picco/services/hive_service.dart';
import 'package:picco/services/location_service.dart';
import 'package:picco/services/log_service.dart';
import 'package:picco/services/utils.dart';

import 'widgets/flutter_widget_to_image.dart';
import 'widgets/home_snackbar_element.dart';
import 'widgets/marker_template_widget.dart';

class SearchPageInherit extends InheritedNotifier<SearchProvider> {
  const SearchPageInherit({
    Key? key,
    required SearchProvider model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  static SearchProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SearchPageInherit>()
        ?.notifier;
  }

  static SearchProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<SearchPageInherit>()
        ?.widget;
    return widget is SearchPageInherit ? widget.notifier : null;
  }
}

class SearchProvider extends ChangeNotifier {
  final textEditingController = TextEditingController(
    text: HiveService.loadString("city"),
  );
  PlaceModel? placeModel;
  final focusNode = FocusNode();
  bool showAutoFeel = false;
  List<HomeModel> homes = [
    HomeModel(
      sellType: 'Buy',
      homeType: 'Home',
      city: 'tashkent',
      district: 'olmazor',
      street: 'ko`cha',
      price: '100',
      definition: 'bla bla bla',
      geo: Geo(
        latitude: 46.123452343,
        longitude: 16.2424552464,
      ),
      houseConveniences: [
        true,
        false,
        true,
        false,
        false,
        false,
        false,
        true,
        false,
        false,
        false,
        false
      ],
      bedsCount: '2',
      bathCount: '4',
      roomsCount: '3',
      houseSize: '200',
      houseImages: [],
    ),
  ];

  // map
  Set<Marker> markers = {};
  Set<Marker> markersWhiteNotTapped = {};
  Set<Marker> markersBlackTapped = {};
  Widget bottomHomeElement = const SizedBox.shrink();
  late final Completer<GoogleMapController> completer = Completer();

  void input(String input) async {
    var response = await LocationService.GET(
      LocationService.API_PLACE,
      LocationService.paramsSearch(text: input),
    );

    if (response != null) {
      showAutoFeel = true;
      placeModel = placeModelFromJson(response);
      notifyListeners();
    }
  }

  Future<Location?> onSelectedLocation(
      {required String location, required BuildContext context}) async {
    textEditingController.text = location;
    focusNode.unfocus();
    showAutoFeel = false;
    notifyListeners();

    late List<Location> locations;

    try {
      locations = await locationFromAddress(location);

      Log.d('${locations.first.latitude} ${locations.first.longitude}');

      return locations.first;
    } catch (e) {
      Utils.fireSnackBar(
        normalText: 'Location not found. Try again!',
        redText: '',
        context: context,
      );
    }

    return null;
  }

  void onInit(BuildContext context) async {
    _generateMarkers(context);
  }

  void onMapCreated(GoogleMapController controller) async {
    completer.complete(controller);
    await _setMapStyle(await completer.future);
    await animateCameraToUserCurrentPosition(await completer.future);
  }

  /// * -- Camera control
  Future<void> animateCameraToUserCurrentPosition(
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

  CameraPosition initialCamPosition() {
    final position = getCityInPosition(
      textEditingController.text.trim().toString(),
    );

    return CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 12.8,
    );
  }

  void zoomIn() async {
    final mapController = await completer.future;
    mapController.animateCamera(CameraUpdate.zoomIn());
    notifyListeners();
  }

  void zoomOut() async {
    final mapController = await completer.future;
    mapController.animateCamera(CameraUpdate.zoomOut());
    notifyListeners();
  }

  Future<void> searchCameraMove({
    double zoom = 14.2,
  }) async {
    final mapController = await completer.future;

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

      notifyListeners();
    }).generate(context);

    MarkerGenerator(_markerWidgetsTapped(), (bitmaps) {
      markersBlackTapped = _mapBitmapsToMarkers(bitmaps);
    }).generate(context);
  }

  List<Widget> _markerWidgetsTapped() {
    return homes
        .map((home) => MarkerTemplateWidget(
              name: home.price,
              tapped: true,
            ))
        .toList();
  }

  List<Widget> _markerWidgetsNotTapped() {
    return homes
        .map((home) => MarkerTemplateWidget(
              name: home.price,
              tapped: false,
            ))
        .toList();
  }

  Set<Marker> _mapBitmapsToMarkers(List<Uint8List> bitmaps) {
    Set<Marker> markersList = {};

    for (int i = 0; i < bitmaps.length; i++) {
      final home = homes[i];
      final bitmap = bitmaps[i];

      final marker = Marker(
        markerId: MarkerId(home.id!),
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

  void updateUIMarkers(HomeModel home) {
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

  void bottomHouseWidgetUpdate(HomeModel home) async {
    final mapController = await completer.future;

    bottomHomeElement = HomeSnackBarElement(
      mapController: mapController,
      homeModel: homes.firstWhere(
        (element) => home.id == element.id,
      ),
    );
    notifyListeners();
  }

  void bottomHouseWidgetClear() {
    markers
      ..clear()
      ..addAll(markersWhiteNotTapped);

    bottomHomeElement = const SizedBox.shrink();
    notifyListeners();
  }
}
