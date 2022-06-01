import 'dart:async';
import 'dart:typed_data';

import 'package:picco/customer/models/home_location_model.dart';
import 'package:picco/customer/models/home_model_map.dart';
import 'package:picco/customer/viewmodel/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_widgets/flutter_widget_to_image.dart';
import 'map_widgets/home_snackbar_element.dart';
import 'map_widgets/marker_template_widget.dart';

class MapPage extends StatefulWidget {
  static const id = "/map_page";

  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with WidgetsBindingObserver {
  Set<Marker> markers = {};
  Set<Marker> markersWhiteNotTapped = {};
  Set<Marker> markersBlackTapped = {};
  List<Widget> bottomHomeElement = [];
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
          fit: StackFit.expand,
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
              initialCameraPosition: _initialCamPosition,
              onTap: (latLng) {
                bottomHouseWidgetClear();
              },
              onCameraMoveStarted: () {

              },
            ),
            ...bottomHomeElement,
          ],
    );
  }

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

  final _initialCamPosition = const CameraPosition(
    target: LatLng(41.31003385680767, 69.24159251153469),
    zoom: 10.8,
  );

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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      mapController.setMapStyle('[]');
    }
  }
}
