import 'package:picco/customer/viewmodel/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../models/list_home_model.dart';

class SheetContent extends StatelessWidget {
  final ScrollController scrollController;

  const SheetContent({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        controller: scrollController,
        itemCount: homesData.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => SizedBox(
          height: 0.4.sh,
          child: Stack(
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(homesData[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.heart,
                            color: Colors.white,
                          ),
                        ),
                      ).putElevation(elevation: 6.0, radius: 10.0),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            homesData[index].name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            homesData[index].prise,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(
                            CupertinoIcons.location,
                            size: 18,
                          ),
                          Text("Яккасарай р. Навоий ул..."),
                          Spacer(),
                          Text("2 rooms  200 m"),
                          Text(
                            "2",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: double.infinity,
                width: double.infinity,
              ).onTapInkwell(function: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
