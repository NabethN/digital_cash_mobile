import 'dart:developer';

import 'package:flutter/material.dart';

class DigitalCard extends StatelessWidget {
  final double width;
  final double height;
  double corner, borderRadius;
  Color cornerColor;
  LinearGradient gradient;
  final bool topLeft, topRight, bottomRight, bottomLeft;

  String text, imagePath;
  // TextStyle textStyle;
  final VoidCallback? onPressed;

  // final Widget? child;

  DigitalCard({
    Key? key,
    this.width = 256,
    this.height = 56,
    this.corner = 0,
    this.borderRadius = 0,
    this.cornerColor = Colors.transparent,
    this.gradient = const LinearGradient(
      begin: Alignment.topLeft,
      colors: <Color>[Color(0xffE72582),Color(0xff7506A5),],
    ),
    this.topLeft = false,
    this.topRight = false,
    this.bottomRight = false,
    this.bottomLeft = false,
    this.text = "Some Rand text",
    required this.imagePath,
    // this.child,
    // this.textStyle = const TextStyle(
    //     fontSize: 22,
    //     fontFamily: 'Heebo',
    //     fontWeight: FontWeight.w500,
    //     color: Colors.white),

    required this.onPressed,

  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    // Widget? current = child;
    //
    // if (child == null) {
    //   current = LimitedBox(
    //     maxWidth: 0.0,
    //     maxHeight: 0.0,
    //     child: ConstrainedBox(constraints: const BoxConstraints.expand()),
    //   );
    // }

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

          // color: Colors.blue,
          // borderRadius: BorderRadius.circular(15.0),
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

          // child: Material(
          //   color: Colors.transparent,
          //   child: InkWell(
          //     onTap: () {},
          //     borderRadius: BorderRadius.circular(15.0),
          //     // splashColor: Colors.grey[500],
          //     child: Center(
          //       child: Text(
          //         "cardText",
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontFamily: 'Circular STD',
          //           fontWeight: FontWeight.w900,
          //           fontSize: 20.0,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                primary: Colors.transparent,
                shadowColor: Colors.transparent
                ),
            // child: current!,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 14, 14),
              child: Stack(
                children: [
                  Text(
                    text,
                    // style: textStyle,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image(
                      image: AssetImage(imagePath),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
