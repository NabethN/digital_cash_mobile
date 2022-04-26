import 'dart:developer';

import 'package:flutter/material.dart';

class EmptyDigitalCard extends StatelessWidget {
  final double width;
  final double height;
  double corner, borderRadius;
  Color cornerColor;
  LinearGradient gradient;
  final bool topLeft, topRight, bottomRight, bottomLeft;

  final Widget? child;

  EmptyDigitalCard({
    Key? key,
    this.width = 250,
    this.height = 56,
    this.corner = 0,
    this.borderRadius = 24,
    this.cornerColor = Colors.transparent,
    this.gradient = const LinearGradient(
      begin: Alignment.topLeft,
      colors: <Color>[Color(0xffE72582),Color(0xff7506A5),],
    ),
    this.topLeft = false,
    this.topRight = false,
    this.bottomRight = false,
    this.bottomLeft = false,
    this.child,
  }) : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    Widget? current = child;

    if (child == null) {
      current = LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      );
    }

    corner = corner == 0
        ? height > 132
        ? 44
        : height / 3
        : corner; //default corner = 0.3*height but if corner is set by user, it's override it. corner never can be set to '0' && never bigger than 44 (Unless user specify it)
    return Stack(alignment: Alignment.center, children: [
      // Container(

      Container(
        width: width - ((corner / 3)),
        height: height - ((corner / 3)),
        // alignment: Alignment.center,

        decoration: BoxDecoration(
          color: cornerColor,
          border: Border.all(
              color: cornerColor == Colors.transparent
                  ? Color(0xffBEBEBE)
                  : cornerColor,
              width: 1),
        ),
      ),
      Material(
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        shape: BeveledRectangleBorder(
          // side: BorderSide(color: Colors.blue), // if you need

          // side: BorderSide(color: Colors.blue), if you need
            borderRadius: BorderRadius.only(
                topLeft: topLeft
                    ? Radius.elliptical(corner, corner)
                    : Radius.circular(0),
                topRight: topRight
                    ? Radius.elliptical(corner, corner)
                    : Radius.circular(0),
                bottomRight: bottomRight
                    ? Radius.elliptical(corner, corner)
                    : Radius.circular(0),
                bottomLeft: bottomLeft
                    ? Radius.elliptical(corner, corner)
                    : Radius.circular(0))),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              gradient: gradient,
              // color: Colors.transparent,
              borderRadius: BorderRadius.circular(borderRadius)),

          child: current!,
        ),
      )
    ]);
  }
}
