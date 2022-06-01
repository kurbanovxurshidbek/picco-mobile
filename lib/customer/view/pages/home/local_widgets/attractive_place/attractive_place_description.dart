import 'package:picco/customer/models/all_models.dart';
import 'package:picco/customer/view/animations/down_to_up.dart';
import 'package:flutter/material.dart';

class AttractivePlaceDescription extends StatefulWidget {
  const AttractivePlaceDescription({Key? key}) : super(key: key);

  @override
  State<AttractivePlaceDescription> createState() =>
      _AttractivePlaceDescriptionState();
}

class _AttractivePlaceDescriptionState
    extends State<AttractivePlaceDescription> {
  bool back = false;

  @override
  Widget build(BuildContext context) {
    final place =
        ModalRoute.of(context)!.settings.arguments as AttractivePlaces;
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          back = true;
        });
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Hero(
              tag: place.name,
              child: Image.asset(place.image),
            ),
            const SizedBox(height: 30),
            back
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DownToUp(
                          delay: 0.8,
                          child: Text(
                            place.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        DownToUp(delay: 1.6, child: Text(place.description)),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
