import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

const int defaultDuration = 500;

class MaterialMotionRoutes {
  static Route<T> fadeThrough<T>(
    Widget page, [
    int duration = defaultDuration,
  ]) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child);
      },
    );
  }

  static Route<T> fadeScale<T>(
    Widget page, [
    int duration = defaultDuration,
  ]) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeScaleTransition(animation: animation, child: child);
      },
    );
  }

  static Route<T> sharedAxis<T>(
    Widget page, [
    SharedAxisTransitionType type = SharedAxisTransitionType.scaled,
    int duration = defaultDuration,
  ]) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          child: child,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: type,
        );
      },
    );
  }
}
