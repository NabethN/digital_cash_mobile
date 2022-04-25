import 'package:flutter/material.dart';

class DigitalButton extends StatelessWidget {
  final double width;
  final double height;
  double corner,  borderRadius;
  Color cornerColor;
  LinearGradient gradient;
  final bool topLeft, topRight, bottomRight, bottomLeft;

  String text;
  TextStyle textStyle;


  DigitalButton({
    Key? key,
    this.width = 256,
    this.height = 56,
    this.corner = 0,
    this.borderRadius = 0,
    this.cornerColor = Colors.transparent,
    this.gradient = const LinearGradient(
      begin: Alignment.topLeft,
      colors: <Color>[Color(0xff7506A5), Color(0xffE72582)],
    ),
    this.topLeft = false,
    this.topRight = false,
    this.bottomRight = false,
    this.bottomLeft = false,
    this.text = "Some Rand text",
    this.textStyle = const TextStyle(
        fontSize: 22,
        fontFamily: 'Heebo',
        fontWeight: FontWeight.w500,
        color: Colors.white),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              borderRadius: BorderRadius.circular(borderRadius)
          ),
          child: ElevatedButton(
            onPressed: () {},

            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent

              // shadowColor: Colors.transparent,

              // shape: RoundedRectangleBorder(borderRadius: borderRadius),
            ),
            child: Text(text,
              style: textStyle,
          ),
        ),
      ),)
    ]);
  }
}
