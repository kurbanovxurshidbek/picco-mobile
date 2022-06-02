import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:picco/customer/view/pages/home/home_page.dart';

import 'page_route_builder.dart';

class IntroSwitchPage extends StatefulWidget {
  const IntroSwitchPage({Key? key}) : super(key: key);

  @override
  _IntroSwitchPageState createState() => _IntroSwitchPageState();
}

class _IntroSwitchPageState extends State<IntroSwitchPage>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  late Timer _timerOne;
  late Timer _timerTwo;
  late Timer _timerThree;

  double _opacity = 0;
  bool _value = true;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(
            ThisIsFadeRoute(page: const HomePage()),
          );
          _timerOne = Timer(const Duration(milliseconds: 300), () {
            scaleController.reset();
          });
        }
      });

    scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 12,
    ).animate(scaleController);

    _timerTwo = Timer(const Duration(milliseconds: 600), () {
      setState(() {
        _opacity = 1.0;
        _value = false;
      });
    });
    _timerThree = Timer(const Duration(milliseconds: 5800), () {
      setState(() {
        scaleController.forward();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scaleController.dispose();
    _timerOne.cancel();
    _timerTwo.cancel();
    _timerThree.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AnimatedOpacity(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(seconds: 6),
              opacity: _opacity,
              child: Lottie.asset(
                'assets/lottie/lottie_intro_switch.json',
                animate: true,
                repeat: true,
                reverse: true,
              ),
            ),
          ),
          Center(
            child: AnimatedOpacity(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(seconds: 6),
              opacity: _opacity,
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(seconds: 2),
                height: _value ? 50 : 150,
                width: _value ? 50 : 150,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurpleAccent.withOpacity(.2),
                      blurRadius: 100,
                      spreadRadius: 10,
                    ),
                  ],
                  color: Colors.deepPurpleAccent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage('assets/logo/logo_picco.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: AnimatedBuilder(
                      animation: scaleAnimation,
                      builder: (c, child) => Transform.scale(
                        scale: scaleAnimation.value,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
