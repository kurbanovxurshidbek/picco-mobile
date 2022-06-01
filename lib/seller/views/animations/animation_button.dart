import 'package:flutter/cupertino.dart';

class AnimationButton extends StatelessWidget {
  final double scale;
  final Widget child;
  final AnimationController controller;

  const AnimationButton(
      {Key? key,
      required this.scale,
      required this.child,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      onTapCancel: _tapCancel,
      child: Transform.scale(
        scale: scale,
        child: child,
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    controller.reverse();
  }

  void _tapCancel(){
    controller.reverse();
  }
}
