import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation(
      {Key key, this.controller, this.opacityEnd, this.childWidget})
      : opacity = Tween<double>(
          begin: 0.0,
          end: opacityEnd,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.5,
              1.000,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  final AnimationController controller;
  final Animation<double> opacity;
  final double opacityEnd;
  final Widget childWidget;

  // This function is called each time the controller "ticks" a new frame.
  // When it runs, all of the animation's values will have been
  // updated to reflect the controller's current value.
  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity.value,
        child: childWidget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
