import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AnnouncementController extends ChangeNotifier {
  PageController pageController = PageController();
  late AnimationController controller;
  late Tween<double> tween;
  late Animation<double> opacityAnimation;
  TextEditingController addressController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  FocusNode addressFocus = FocusNode();
  FocusNode titleFocus = FocusNode();

  bool isExpanded = false;
  bool isScrolledUp = false;
  bool isDisabled = true;
  int currentPageIndex = 0;
  int price = 0;

  List<double> heights = [
    0.47.sh,
    0.47.sh,
    0.8.sh,
    0.55.sh,
    0.9.sh,
    0.9.sh,
    0.75.sh,
    0.7.sh,
    0.7.sh,
    0.7.sh,
    0.64.sh,
    1.sh,
  ];

  List<String> headers = [
    'С возвращением, Жасурбек',
    'Чего вы предлогаете и каком типе хотите вести продажу?',
    'Какой у вас жильё?',
    'Чего вы предлогаете и каком типе хотите вести продажу?',
    '',
    '',
    'Раскажите гостям о примуществах ващего жиля',
    'Добавить фото жиля',
    'Добавить фото жиля',
    'Довайте придумаем яркий заголовок',
    'Довайте установим цену',
    '',
  ];

  final List<String> options = [
    'Ташкент',
    'Андижан',
    'Фергана',
    'Ташкентский область',
    'Самарканд',
    'Каракалпакистан',
  ];
  String? selectedOption = 'Ташкент';

  navigate(int index) {
    currentPageIndex = index;
    notifyListeners();

    controller.repeat(reverse: false);
    controller.forward();

    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  updateHeight() {
    isExpanded = !isExpanded;
    if (isExpanded) {
      heights[2] = 0.88.sh;
    } else {
      heights[2] = 0.68.sh;
    }
    notifyListeners();
  }
  updatePrice(bool isIncreased){
    isIncreased ? price += 1 : price != 0 ? price -= 1 : null;
    notifyListeners();
  }

  chooseOption(String option) {
    selectedOption = option;
    notifyListeners();
  }
}

class Announcement1 extends StatefulWidget {
  const Announcement1({Key? key}) : super(key: key);

  @override
  State<Announcement1> createState() => _Announcement1State();
}

class _Announcement1State extends State<Announcement1>
    with SingleTickerProviderStateMixin {
  final AnnouncementController viewModel = AnnouncementController();

  @override
  void initState() {
    viewModel.controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1100));
    viewModel.tween = Tween(begin: 0.0, end: 1.0);
    viewModel.opacityAnimation = viewModel.tween.animate(viewModel.controller);
    viewModel.controller.forward();

    super.initState();
  }

  @override
  dispose() {
    viewModel.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => viewModel,
      child: Consumer<AnnouncementController>(builder: (ctx, model, index) {
        return Scaffold(
          resizeToAvoidBottomInset: viewModel.currentPageIndex == 9,
          extendBodyBehindAppBar: true,
          appBar: viewModel.currentPageIndex == 11 ? null : AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              splashRadius: 1,
              icon: const Icon(
                Icons.cancel,
                color: Color.fromRGBO(187, 183, 183, 0.6),
                size: 34,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  child: Text(
                    'Помощь',
                    style: TextStyle(color: Colors.white, fontSize: 15.sp),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 0.0,
                  color: const Color.fromRGBO(187, 183, 183,
                      0.6), //const Color(0xffBBB7B799).withOpacity(0.6),
                  onPressed: () {},
                ),
              )
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1, -1),
                end: Alignment(2.7, 0),
                colors: [
                  Color(0xff7842D0),
                  Color(0xffE41547),
                  Color(0xffD82490),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!viewModel.isExpanded)
                  Expanded(
                    child: Container(
                      // height: 250.h,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeTransition(
                            opacity: viewModel.opacityAnimation,
                            child: Text(
                              viewModel.headers[viewModel.currentPageIndex],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    height: viewModel.heights[viewModel.currentPageIndex],
                    width: 1.sw,
                    alignment: Alignment.bottomCenter,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutSine,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                      ),
                    ),
                    child: PageView(
                      controller: viewModel.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        FirstPage(viewModel: viewModel),
                        SecondPage(viewModel: viewModel),
                        ThirdPage(viewModel: viewModel),
                        FourthPage(viewModel: viewModel),
                        FifthPage(viewModel: viewModel),
                        SixthPage(viewModel: viewModel),
                        SeventhPage(viewModel: viewModel),
                        EighthPage(viewModel: viewModel),
                        NinthPage(viewModel: viewModel),
                        TenthPage(viewModel: viewModel),
                        EleventhPage(viewModel: viewModel),
                        TwelfthPage(viewModel: viewModel),
                      ],
                      onPageChanged: (int index) {
                        viewModel.navigate(index);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class FirstPage extends StatelessWidget {
  final AnnouncementController viewModel;

  const FirstPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Consumer<AnnouncementController>(builder: (ctx, model, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Станьте хозяином всего за 5 шагов',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.sp),
              ),
              SizedBox(height: 30.h),
              Text(
                'Присоединитесь. Мы с радостью поможем',
                style: TextStyle(fontSize: 16.sp),
              ),
              const Spacer(),
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  'Старт',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: const Color(0xff7842D0),
                onPressed: () {
                  viewModel.navigate(1);
                },
              )
            ],
          ),
        );
      }),
    );
  }
}

class SecondPage extends StatelessWidget {
  final AnnouncementController viewModel;
  static const Map<String, String> data = {
    'Продать жильё': 'Продать многокомнатную квартиру, зданию или участок',
    'Сдать в аренду жильё':
        'Сдать в аренду многокомнатную квартиру, отель или место для бизнеса',
  };

  const SecondPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Consumer<AnnouncementController>(builder: (ctx, model, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 20.h);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.black)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.keys.toList()[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18.sp),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            data.values.toList()[index],
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Divider(
                color: Color(0xff7842D0),
                thickness: 2,
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: const Text(
                        'Назад',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.transparent,
                      elevation: 0.0,
                      onPressed: () {
                        viewModel.navigate(0);
                      },
                    ),
                    MaterialButton(
                        child: const Text(
                          'Далее',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        color: const Color(0xff7842D0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        onPressed: () {
                          viewModel.navigate(2);
                        })
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class ThirdPage extends StatelessWidget {
  static const Map<String, String> data = {
    'Дом / квартира': 'assets/images/1.png',
    'Здание для бизнеса': 'assets/images/2.png',
    'Новостройки': 'assets/images/3.png',
    'Коттедж': 'assets/images/4.png',
    'Гостиницы': 'assets/images/5.png',
    'Загородные дома': 'assets/images/6.png',
  };
  final AnnouncementController viewModel;

  const ThirdPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Consumer<AnnouncementController>(builder: (ctx, model, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 20.h);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: 76,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data.keys.toList()[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18.sp),
                            ),
                            Container(
                              height: 76,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image(
                                image: AssetImage(
                                  data.values.toList()[index],
                                ),
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ));
                  },
                ),
              ),
              const Divider(
                color: Color(0xff7842D0),
                thickness: 2,
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: const Text(
                        'Назад',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.transparent,
                      elevation: 0.0,
                      onPressed: () {
                        viewModel.navigate(1);
                      },
                    ),
                    MaterialButton(
                      child: const Text(
                        'Далее',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      color: const Color(0xff7842D0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        viewModel.navigate(3);
                        // viewModel.update();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class FourthPage extends StatelessWidget {
  final AnnouncementController viewModel;

  const FourthPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Consumer<AnnouncementController>(builder: (ctx, model, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                      ),
                    ),
                    child: const Image(
                      image: AssetImage(
                        'assets/images/map_view.png',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    top: 20.0,
                    left: 30.0,
                    right: 30.0,
                    height: 60,
                    child: TextField(
                      controller: viewModel.addressController,
                      focusNode: viewModel.addressFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black87),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                        labelText: 'Введите аддрес',
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        floatingLabelStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        labelStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black87,
                        ),
                        // suffixIcon: viewModel.isNotEmpty
                        //     ? IconButton(
                        //     splashRadius: 1,
                        //     icon: const Icon(CupertinoIcons.clear,
                        //         size: 18, color: Colors.white),
                        //     onPressed: () {
                        //       viewModel.clear();
                        //     })
                        //     : const SizedBox.shrink(),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.black54,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.black54,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.black54,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (String txt) {
                        // viewModel.change(txt);
                      },
                      onSubmitted: (String account) {
                        // viewModel.storeHistory(account);
                        // viewModel.findUser(context);
                      },
                    ),
                  ),
                ],
              )),
              const Divider(
                color: Color(0xff7842D0),
                thickness: 2,
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: const Text(
                        'Назад',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.transparent,
                      elevation: 0.0,
                      onPressed: () {
                        viewModel.navigate(1);
                      },
                    ),
                    MaterialButton(
                      child: const Text(
                        'Далее',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      color: const Color(0xff7842D0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        viewModel.navigate(4);
                        // viewModel.update();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class FifthPage extends StatelessWidget {
  final AnnouncementController viewModel;

  const FifthPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Consumer<AnnouncementController>(builder: (ctx, model, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          // padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// Create address text
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          viewModel.navigate(3);
                        },
                        icon: const Icon(Icons.arrow_back, size: 27),
                      ),
                      const SizedBox(width: 17),
                      const Text(
                        "Введите аддрес",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),

                  ///Search
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.blueAccent, width: 1),
                          borderRadius: BorderRadius.circular(30)),
                      hintText: "Поиск",
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(
                        Icons.near_me_outlined,
                        size: 25,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  ///Location
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.location_on,
                          size: 30,
                        ),
                      ),
                      const Text(
                        'Выбрать текущее местоположения',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),

                  ///Line
                  const Divider(color: Color(0xFFC4C4C4)),

                  ElevatedButton(
                    style: ButtonStyle(
                      alignment: Alignment.centerRight,
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      elevation: MaterialStateProperty.resolveWith<double>(
                          (Set<MaterialState> states) => 0.0),
                    ),
                    child: const Text(
                      'Введите аддрес вручную',
                      style: TextStyle(
                        color: Color(0xFF544AEB),
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      viewModel.navigate(5);
                    },
                  ),
                ],
              )),
              const Divider(
                color: Color(0xff7842D0),
                thickness: 2,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: viewModel.isDisabled
                    ? Colors.grey.shade300
                    : const Color(0xff4f4e9a),
                splashColor:
                    viewModel.isDisabled ? Colors.transparent : Colors.white54,
                textColor: viewModel.isDisabled ? Colors.black45 : Colors.white,
                child: const Text(
                  'Сохранить',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  viewModel.isDisabled ? null : Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

class SixthPage extends StatelessWidget {
  final AnnouncementController viewModel;

  SixthPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Consumer<AnnouncementController>(builder: (ctx, model, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              viewModel.navigate(4);
                            },
                            icon: const Icon(Icons.arrow_back, size: 27),
                          ),
                          const SizedBox(width: 17),
                          const Text(
                            'Введите аддрес',
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: 1.sw,
                        child: DropdownButtonFormField<String>(
                          icon: const Icon(Icons.keyboard_arrow_down, size: 30),
                          iconEnabledColor: Colors.black54,
                          iconDisabledColor: Colors.grey,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                10.0, 14.0, 10.0, 14.0),
                            labelText: 'Область',
                            labelStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                          ),
                          value: viewModel.selectedOption,
                          items: viewModel.options
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (option) {
                            viewModel.chooseOption(option!);
                          },
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        width: 1.sw,
                        child: DropdownButtonFormField<String>(
                          icon: const Icon(Icons.keyboard_arrow_down, size: 30),
                          iconEnabledColor: Colors.black54,
                          iconDisabledColor: Colors.grey,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                10.0, 14.0, 10.0, 14.0),
                            labelText: 'Район/Город',
                            labelStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                          ),
                          items: viewModel.options
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (option) {
                            viewModel.chooseOption(option!);
                          },
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        width: 1.sw,
                        child: DropdownButtonFormField<String>(
                          icon: const Icon(Icons.keyboard_arrow_down, size: 30),
                          iconEnabledColor: Colors.black54,
                          iconDisabledColor: Colors.grey,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                10.0, 14.0, 10.0, 14.0),
                            labelText: 'Улица',
                            labelStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                          ),
                          items: viewModel.options
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (option) {
                            viewModel.chooseOption(option!);
                          },
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Divider(color: Colors.grey.shade400, thickness: 2),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Точное место',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Вы можете показать, где именно находится жилье',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20.0),
                            ),
                            border: Border.all(
                                color: Colors.grey.shade400, width: 3)),
                        child: const Image(
                          image: AssetImage(
                            'assets/images/map_view.png',
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Color(0xff7842D0),
                thickness: 2,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: const Color(0xff4f4e9a),
                splashColor: Colors.white54,
                textColor: Colors.white,
                child: const Text(
                  'Сохранить',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  // viewModel.isDisabled ? null : Navigator.pop(context);
                  viewModel.navigate(6);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

class SeventhPage extends StatelessWidget {
  final AnnouncementController viewModel;
  final Map<String, String> media = {
    'assets/icons/announcement_page_icons/kitchen_furniture.png':
        'Кухонный мебель',
    'assets/icons/announcement_page_icons/furniture.png': 'Мебель в комнатах',
    'assets/icons/announcement_page_icons/fridge.png': 'Холодильник',
    'assets/icons/announcement_page_icons/washing_machine.png':
        'Стиральная машина',
    'assets/icons/announcement_page_icons/tv.png': 'Телевизор',
    'assets/icons/announcement_page_icons/wifi.png': 'Internet',
    'assets/icons/announcement_page_icons/airconditioning.png': 'Кондитционер',
    'assets/icons/announcement_page_icons/dishwasher.png': 'Посудамойка',
    'assets/icons/announcement_page_icons/bedroom.png': 'Душевая кабина',
    'assets/icons/announcement_page_icons/baby.png': 'Можно с детми',
    'assets/icons/announcement_page_icons/animals.png': 'Можно с животными',
  };
  SeventhPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Consumer<AnnouncementController>(builder: (ctx, model, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  children: [
                    const Text(
                      'Есть ли у вас особые удобства ?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: 8,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                media.values.toList()[index],
                                style: const TextStyle(fontSize: 15),
                              ),
                              const SizedBox(height: 20.0),
                              Image.asset(
                                media.keys.toList()[index],
                                height: 35,
                                width: 35,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color(0xff7842D0),
                thickness: 2,
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: const Text(
                        'Назад',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.transparent,
                      elevation: 0.0,
                      onPressed: () {
                        viewModel.navigate(1);
                      },
                    ),
                    MaterialButton(
                      child: const Text(
                        'Далее',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      color: const Color(0xff7842D0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        viewModel.navigate(7);
                        // viewModel.update();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class EighthPage extends StatelessWidget {
  final AnnouncementController viewModel;
  final Map<String, String> media = {
    'assets/icons/announcement_page_icons/photo_upload.png': 'Загрузить фото',
    'assets/icons/announcement_page_icons/photo_take.png': 'Зделать новое фото',
  };
  EighthPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Consumer<AnnouncementController>(builder: (ctx, model, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        alignment: Alignment.center,
                        child: ListTile(
                          onTap: () {
                            viewModel.navigate(8);
                          },
                          leading: const Icon(Icons.cloud_upload, size: 30),
                          title: Text(
                            media.values.toList()[0],
                            style: const TextStyle(fontSize: 20),
                          ),
                        )),
                    const SizedBox(height: 18.0),
                    Container(
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        alignment: Alignment.center,
                        child: ListTile(
                          onTap: () {
                            viewModel.navigate(8);
                          },
                          leading: const Icon(Icons.camera_alt, size: 30),
                          title: Text(
                            media.values.toList()[1],
                            style: const TextStyle(fontSize: 20),
                          ),
                        )),
                  ],
                ),
              ),
              const Divider(
                color: Color(0xff7842D0),
                thickness: 2,
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: const Text(
                        'Назад',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.transparent,
                      elevation: 0.0,
                      onPressed: () {
                        viewModel.navigate(6);
                      },
                    ),
                    MaterialButton(
                      child: const Text(
                        'Далее',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      color: const Color(0xff7842D0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        viewModel.navigate(8);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class NinthPage extends StatelessWidget {
  final AnnouncementController viewModel;
  final List<String> images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
  ];
  NinthPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Consumer<AnnouncementController>(builder: (ctx, model, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Готово всё в порядке',
                          style: TextStyle(fontSize: 18),
                        ),
                        MaterialButton(
                          child: Row(
                            children: const [
                              Icon(Icons.cloud_upload_outlined),
                              SizedBox(width: 8.0),
                              Text(
                                'Загрузить',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          elevation: 0.0,
                          color: const Color.fromRGBO(187, 183, 183, 0.6),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 14.0),
                    Container(
                        width: 1.sw,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Image(
                          image: AssetImage(images.first),
                          fit: BoxFit.cover,
                        )),
                    const Divider(color: Colors.transparent),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Image(
                                image: AssetImage(images[1]),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const VerticalDivider(color: Colors.transparent),
                        Expanded(
                          child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Image(
                                image: AssetImage(images.last),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                color: Color(0xff7842D0),
                thickness: 2,
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: const Text(
                        'Назад',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.transparent,
                      elevation: 0.0,
                      onPressed: () {
                        viewModel.navigate(7);
                      },
                    ),
                    MaterialButton(
                      child: const Text(
                        'Далее',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      color: const Color(0xff7842D0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        viewModel.navigate(9);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class TenthPage extends StatelessWidget {
  final AnnouncementController viewModel;

  const TenthPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Consumer<AnnouncementController>(builder: (ctx, model, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  controller: viewModel.titleController,
                  focusNode: viewModel.titleFocus,
                  keyboardType: TextInputType.multiline,

                  maxLength: 50,
                  maxLines: null,

                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 35),
                    hintText: 'Загаловок',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 18),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.black54),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.black54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.black54),
                    ),

                  ),
                ),
              ),
              const Divider(
                color: Color(0xff7842D0),
                thickness: 2,
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: const Text(
                        'Назад',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.transparent,
                      elevation: 0.0,
                      onPressed: () {
                        viewModel.navigate(8);
                      },
                    ),
                    MaterialButton(
                      child: const Text(
                        'Далее',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      color: const Color(0xff7842D0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        viewModel.navigate(10);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class EleventhPage extends StatelessWidget {
  final AnnouncementController viewModel;

  const EleventhPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Consumer<AnnouncementController>(builder: (ctx, model, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children:[
                      // #Set price
                      SizedBox(
                        height: 70,
                        child: Row(
                          children: [
                            MaterialButton(
                              minWidth: 40,
                              height: 40,
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Icon(CupertinoIcons.minus, color: Colors.white, size: 30,),
                              onPressed: (){
                                viewModel.updatePrice(false);
                              },
                            ),
                            Expanded(
                              child: Container(
                              height: 70,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              child: Text(
                                '\$${viewModel.price}',
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 30),
                              ),
                            ),),
                            MaterialButton(
                              minWidth: 40,
                              height: 40,
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Icon(Icons.add, color: Colors.white, size: 30,),
                              onPressed: (){
                                viewModel.updatePrice(true);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: Container(
                          height: 40,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Text(
                            'За Месяц',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Жилье похожие на ваше, стоит от \$160 до \$240',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                    ]
                  ),
                )
              ),
              const Divider(
                color: Color(0xff7842D0),
                thickness: 2,
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: const Text(
                        'Назад',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.transparent,
                      elevation: 0.0,
                      onPressed: () {
                        viewModel.navigate(9);
                      },
                    ),
                    MaterialButton(
                      child: const Text(
                        'Далее',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      color: const Color(0xff7842D0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        viewModel.navigate(11);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class TwelfthPage extends StatelessWidget {
  final AnnouncementController viewModel;

  const TwelfthPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Consumer<AnnouncementController>(builder: (ctx, model, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const Image(
                          image: AssetImage(
                            'assets/images/1.png',
                          ),
                          fit: BoxFit.fitWidth
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text('Pretty House', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      const SizedBox(height: 5.0),
                      Divider(color: Colors.grey.shade300, thickness: 2),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Text('Выбранные загаловок для обявление: Уютные дом sdsdsdsdsdsd sdsd sd sds d sd', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), maxLines: 2, overflow: TextOverflow.ellipsis,),
                            )
                          ),
                          Icon(Icons.account_circle, size: 50,)
                        ]
                      ),
                      const SizedBox(height: 5.0),
                      Divider(color: Colors.grey.shade300, thickness: 2),
                      const SizedBox(height: 10.0),
                      const Center(
                        child: Text(
                          '● 1 Ванная   ● 1 Кровать   ● 1 Телевизор',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Divider(color: Colors.grey.shade300, thickness: 2),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Описание дома',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 10.0),
                      Divider(color: Colors.grey.shade300, thickness: 2),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Местоположение',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Chorsu, Chinni bozor, Pdp Academy',
                        style: TextStyle(fontSize: 18),
                      ),
                    ]
                  ),
                )
              ),
              const Divider(
                color: Color(0xff7842D0),
                thickness: 2,
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: const Text(
                        'Назад',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.transparent,
                      elevation: 0.0,
                      onPressed: () {
                        viewModel.navigate(10);
                      },
                    ),
                    MaterialButton(
                      child: const Text(
                        'Сохранить обявление',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      color: const Color(0xff7842D0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
