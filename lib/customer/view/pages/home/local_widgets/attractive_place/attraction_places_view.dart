import 'package:picco/models/all_models.dart';
import 'package:flutter/material.dart';

import 'package:picco/customer/viewmodel/utils.dart';

import 'attractive_place_description.dart';

class AttractionPlaceView extends StatefulWidget {
  const AttractionPlaceView({Key? key}) : super(key: key);

  @override
  State<AttractionPlaceView> createState() => _AttractionPlaceViewState();
}

class _AttractionPlaceViewState extends State<AttractionPlaceView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.7),
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        physics: const BouncingScrollPhysics(),
        itemCount: AttractivePlacesList.list(context).length,
        itemBuilder: (context, index) {
          var scale = currentIndex == index ? 1.0 : 0.9;
          return lookingPlaces(index: index, scale: scale);
        },
      ),
    );
  }

  lookingPlaces({index, scale}) {
    return Column(
      children: [
        Expanded(
          child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 350),
            tween: Tween(begin: scale, end: scale),
            curve: Curves.ease,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: Hero(
                tag: AttractivePlacesList.list(context)[index].name,
                child: Image.asset(
                  AttractivePlacesList.list(context)[index].image,
                  fit: BoxFit.cover,
                ).onTap(function: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 800),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 600),
                      pageBuilder: (context, _, __) =>
                          const AttractivePlaceDescription(),
                      settings:
                          RouteSettings(arguments: AttractivePlacesList.list(context)[index]),
                    ),
                  );
                }),
              ),
            ),
            builder: (context, value, child) =>
                Transform.scale(scale: value as double?, child: child),
          ),
        ),
        const SizedBox(height: 10),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Text(
            ImageCityList.list(context)[index].name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          crossFadeState: currentIndex == index
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 500),
        ),
      ],
    );
  }
}
