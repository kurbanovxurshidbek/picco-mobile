import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.5,
        title: const Text(
          "Statistics",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff1E2630),
                ),
                height: 223.h,
                width: 350.w,
                child: LineChart(
                  LineChartData(
                      titlesData: FlTitlesData(
                        topTitles: AxisTitles(
                          axisNameWidget: const Text(
                            "Daily routine",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          axisNameWidget: const Text(
                            "Mart",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false
                          )
                        ),

                      ),
                      // chart horizontal and vertical line color
                      gridData: FlGridData(
                        show: true,
                        getDrawingHorizontalLine: (value) =>
                            FlLine(color: Color(0xff2E3941), strokeWidth: 1.5),
                        drawVerticalLine: true,
                        getDrawingVerticalLine: (value) =>
                            FlLine(color: Color(0xff2E3941), strokeWidth: 1.5),
                      ),
                      baselineX: 5,
                      minX: 0,
                      maxX: 11,
                      minY: 0,
                      maxY: 6,
                      // Colorful line
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            const FlSpot(0, 2.5),
                            const FlSpot(2.6, 5),
                            const FlSpot(4.5, 5),
                            const FlSpot(5, 3),
                            const FlSpot(9, 3),
                          ],
                          isCurved: true,
                          belowBarData: BarAreaData(
                              show: true,
                              color: Color(0xff17BADA).withOpacity(0.3)),
                        ),
                      ],
                      borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.black, width: 1))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffFDFDFD),
                          borderRadius: BorderRadius.circular(10.r)),
                      height: 75.h,
                      width: 78.w,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "10",
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            Text(
                              "SMS",
                              style: TextStyle(fontSize: 15.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffFDFDFD),
                          borderRadius: BorderRadius.circular(10.r)),
                      height: 75.h,
                      width: 143.w,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "10",
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            Text(
                              "All Views",
                              style: TextStyle(fontSize: 15.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffFDFDFD),
                          borderRadius: BorderRadius.circular(10.r)),
                      height: 75.h,
                      width: 78.w,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "28",
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            Text(
                              "Calls",
                              style: TextStyle(fontSize: 15.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mirabad district",
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w600),
                    ),
                    Text("\$5880",
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ReadMoreText(
                  'If you dreamed of buying an apartment in a friendly family complex welcome. You can choose your likely home by the way for more information Lets get start it and choose your devircy ceaca cacc',
                  style: TextStyle(color: Colors.black),
                  trimLines: 2,
                  colorClickableText: Colors.blue,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read more...',
                  trimExpandedText: ' show less',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GridView.builder(
                //padding:  EdgeInsets.only(left: 8.w, right: 8.w),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: DetailElems.details.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) =>
                    buildGridContainer(DetailElems.details[index]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "  All photos",
                    style: TextStyle(color: Color(0xff4F4E9A), fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 100.h,
                    width: double.infinity,
                    child: ListView.builder(
                        padding: EdgeInsets.only(
                            right: 12.w, top: 12.h, bottom: 12.h),
                        scrollDirection: Axis.horizontal,
                        itemCount: Detailphotos.photos.length,
                        itemBuilder: (context, index) =>
                            buildListContainer(Detailphotos.photos[index])),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description",
                        style: TextStyle(
                            color: Color(0xff4F4E9A), fontSize: 20.sp)),
                    SizedBox(
                      height: 10.h,
                    ),
                    const ReadMoreText(
                      'If you dreamed of buying an apartment in a friendly family complex welcome. You can choose your likely home by the way for more information Lets get start it and choose your devircy ceaca cacc',
                      style: TextStyle(color: Colors.black),
                      trimLines: 2,
                      colorClickableText: Colors.blue,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Read more...',
                      trimExpandedText: ' show less',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("What this place offers",
                        style: TextStyle(
                            color: const Color(0xff4F4E9A), fontSize: 20.sp)),
                  ],
                ),
              ),
              for (int i = 0; i < 5; i++)
                Padding(
                  padding: EdgeInsets.all(15.w),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/hotels.png',
                        height: 25.w,
                        width: 25.w,
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        'Fireplace in the hall.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10.r),
                child: Container(
                  height: 54.h,
                  width: 340.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.w),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Text(
                    'Show all convenience: 5',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// List view builder
  Container buildListContainer(Detailphotos model) => Container(
        margin: EdgeInsets.only(left: 10.w, right: 10.w),
        height: 86.h,
        width: 89.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
                image: AssetImage(model.photo), fit: BoxFit.cover)),
      );

//Grid view builder
  Container buildGridContainer(DetailElems elems) => Container(
        margin: EdgeInsets.all(10.w),
        padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
            border: Border.all(width: 0.3.w),
            borderRadius: BorderRadius.circular(10.r)),
        height: 78.h,
        width: 75.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              elems.imageIcon,
              width: 35.w,
              height: 35.h,
            ),
            const Spacer(),
            Text(
              elems.rooms,
              style: TextStyle(fontSize: 10.sp),
            )
          ],
        ),
      );
}

//grid elements
class DetailElems {
  String rooms;
  String imageIcon;

  DetailElems(this.rooms, this.imageIcon);

  static List<DetailElems> details = [
    DetailElems("Bath", "assets/icons/1.png"),
    DetailElems("Bath", "assets/icons/2.png"),
    DetailElems("Bath", "assets/icons/3.png"),
    DetailElems("Bath", "assets/icons/4.png"),
    DetailElems("Bath", "assets/icons/1.png"),
    DetailElems("Bath", "assets/icons/2.png"),
    DetailElems("Bath", "assets/icons/3.png"),
    DetailElems("Bath", "assets/icons/4.png"),
    DetailElems("Bath", "assets/icons/1.png"),
    DetailElems("Bath", "assets/icons/2.png"),
    DetailElems("Bath", "assets/icons/3.png"),
    DetailElems("Bath", "assets/icons/4.png"),
  ];
}

//list elements
class Detailphotos {
  String photo;

  Detailphotos(this.photo);

  static List<Detailphotos> photos = [
    Detailphotos("assets/images/1.png"),
    Detailphotos("assets/images/2.png"),
    Detailphotos("assets/images/3.png"),
    Detailphotos("assets/images/4.png"),
    Detailphotos("assets/images/5.png"),
    Detailphotos("assets/images/6.png"),
    Detailphotos("assets/images/7.png"),
  ];
}
