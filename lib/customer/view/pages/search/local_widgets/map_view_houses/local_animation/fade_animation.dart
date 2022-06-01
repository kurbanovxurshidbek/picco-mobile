import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimationType { opacity, translateY, bouncing }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({
    Key? key,
    required this.delay,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimationType>()
      ..add(
        AnimationType.opacity,
        Tween(begin: 0.0, end: 1.0),
        const Duration(milliseconds: 400),
      )
      ..add(
        AnimationType.translateY,
        Tween(begin: 120.0, end: 0.0),
        const Duration(milliseconds: 400),
      )
      ..add(
        AnimationType.bouncing,
        Tween(begin: 30.0, end: -30.0),
        const Duration(milliseconds: 1400),
        Curves.bounceOut,
      );
    return PlayAnimation<MultiTweenValues<AnimationType>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AnimationType.opacity),
        child: Transform.translate(
          offset: Offset(0, value.get(AnimationType.translateY)),
          child: Transform.translate(
            offset: Offset(-2, value.get(AnimationType.bouncing)),
            child: child,
          ),
        ),
      ),
    );
  }
}
