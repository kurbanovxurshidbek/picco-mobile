import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:picco/customer/view/pages/search/local_widgets/filtr/filtr_view.dart';
import 'package:picco/services/hive_service.dart';
import 'package:picco/services/log_service.dart';

import 'bottom_sheet.dart';
import 'search_page_provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchPageInherit(
      model: SearchProvider(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View({Key? key}) : super(key: key);

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
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60.h),
        child: const SearchPageAppBar(),
      ),
      body: Stack(
        children: const [
          MapView(),
          BottomHomeElement(),
          LocationButton(),
          BottomSheetWidget(),
          AutoFeelContainer(),
        ],
      ),
    );
  }
}

class SearchPageAppBar extends StatelessWidget {
  const SearchPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = SearchPageInherit.watch(context)!;

    return AppBar(
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
            focusNode: provider.focusNode,
            controller: provider.textEditingController,
            onChanged: provider.input,
            onEditingComplete: () {
              provider.onSelectedLocation(
                location: provider.textEditingController.text.trim().toString(),
                context: context,
              );
            },
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
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
    );
  }
}

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = SearchPageInherit.read(context)!;

    return GoogleMap(
      markers: provider.markers,
      onMapCreated: provider.onMapCreated,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      mapToolbarEnabled: false,
      zoomControlsEnabled: false,
      compassEnabled: false,
      buildingsEnabled: false,
      initialCameraPosition: provider.initialCamPosition(),
      onTap: (latLng) {
        provider.bottomHouseWidgetClear();
        Log.e('lang: ${latLng.latitude} long: ${latLng.longitude}');
      },
      onCameraMoveStarted: () {},
    );
  }
}

class BottomHomeElement extends StatelessWidget {
  const BottomHomeElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = SearchPageInherit.watch(context)!;

    return provider.bottomHomeElement;
  }
}

class LocationButton extends StatelessWidget {
  const LocationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = SearchPageInherit.read(context)!;

    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(
          top: 20.h,
          left: 10.h,
          right: 10.h,
        ),
        alignment: Alignment.center,
        height: 50.h,
        width: 50.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.gps_not_fixed_rounded,
            color: Colors.grey,
            size: 26,
          ),
          onPressed: () async => provider.animateCameraToUserCurrentPosition(
            await provider.completer.future,
            zoom: 12.8,
          ),
        ),
      ),
    );
  }
}

class AutoFeelContainer extends StatelessWidget {
  const AutoFeelContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = SearchPageInherit.watch(context)!;

    if (provider.showAutoFeel) {
      return Container(
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
          itemCount: provider.placeModel!.predictions.length,
          separatorBuilder: (BuildContext context, int index) =>
              Divider(height: 2.h),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                  '${provider.placeModel!.predictions[index].description}'),
              onTap: () {
                Log.d('${provider.placeModel!.predictions[index].description}');
                provider.onSelectedLocation(
                  location:
                      provider.placeModel!.predictions[index].description ??
                          provider.textEditingController.text.trim().toString(),
                  context: context,
                );
              },
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
