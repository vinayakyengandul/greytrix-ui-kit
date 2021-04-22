import 'package:flutter/material.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

class GtCard extends StatelessWidget {
  GtCard(
      {this.cardColor,
      this.shadowColor,
      this.shape,
      this.elevation,
      this.label,
      this.imageURL,
      this.cardheight,
      this.cardwidth,
      this.imageWidth,
      this.imageheight,
      this.boxFit,
      this.textStyle});

  final Color cardColor;
  final Color shadowColor;
  final ShapeBorder shape;
  final double elevation;
  final double cardheight;
  final double cardwidth;
  final double imageheight;
  final double imageWidth;
  final String label;
  final dynamic imageURL;
  final BoxFit boxFit;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      child: Card(
        borderOnForeground: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.all(2.0),
        shadowColor: shadowColor ?? Colors.grey,
        color: cardColor ?? Colors.white,
        shape: shape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: elevation ?? 1.0,
        child: Container(
          height: cardheight ?? 140,
          width: cardwidth ?? 150,
          padding: EdgeInsets.all(5.0),
          child: Column(children: [
            GtImageCard(
              height: imageheight,
              width: imageWidth,
              boxFit: boxFit,
              imageURL: imageURL,
            ),
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Center(
                  child: GtText(
                    text: label,
                    textStyle: textStyle,
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
