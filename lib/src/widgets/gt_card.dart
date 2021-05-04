import 'package:flutter/material.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

class GtCard extends StatelessWidget {
  GtCard({
    this.cardColor,
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
    this.textStyle,
    this.imagePosition = GtImagePosition.TOP,
    this.imageBackgroundColor,
    this.isNetworkImage,
    this.cardRadius,
    this.textPadding = 2.0,
  });

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
  final GtImagePosition imagePosition;
  final Color imageBackgroundColor;
  final bool isNetworkImage;
  final double cardRadius;
  final double textPadding;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      child: Card(
        borderOnForeground: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.all(2.0),
        shadowColor: shadowColor ?? Colors.white,
        color: cardColor ?? Colors.white,
        shape: shape ??
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cardRadius ?? 5.0)),
        elevation: elevation ?? 1.0,
        child: Container(
            height: cardheight ?? 140,
            width: cardwidth ?? 150,
            padding: EdgeInsets.all(2.0),
            child: getCardwidget(imagePosition)),
      ),
    );
  }

  Widget getCardwidget(GtImagePosition imagePosition) {
    switch (imagePosition) {
      case GtImagePosition.LEFT:
        return Row(children: [
          GtImageCard(
              height: imageheight,
              width: imageWidth,
              boxFit: boxFit,
              imageURL: imageURL,
              backgroundcolor: imageBackgroundColor,
              isNetworkImage: isNetworkImage),
          Padding(
              padding: EdgeInsets.all(textPadding),
              child: Center(
                child: GtText(
                  text: label,
                  textStyle: textStyle,
                ),
              )),
        ]);
        break;

      case GtImagePosition.TOP:
        return Column(children: [
          GtImageCard(
            height: imageheight,
            width: imageWidth,
            boxFit: boxFit,
            imageURL: imageURL,
            backgroundcolor: imageBackgroundColor,
            isNetworkImage: isNetworkImage,
          ),
          Padding(
              padding: EdgeInsets.all(textPadding),
              child: Center(
                child: GtText(
                  text: label,
                  textStyle: textStyle,
                ),
              )),
        ]);
        break;

      case GtImagePosition.RIGHT:
        return Row(children: [
          Padding(
              padding: EdgeInsets.all(textPadding),
              child: Center(
                child: GtText(
                  text: label,
                  textStyle: textStyle,
                ),
              )),
          GtImageCard(
              height: imageheight,
              width: imageWidth,
              boxFit: boxFit,
              imageURL: imageURL,
              backgroundcolor: imageBackgroundColor,
              isNetworkImage: isNetworkImage),
        ]);
        break;

      case GtImagePosition.BOTTOM:
        return Column(children: [
          Padding(
              padding: EdgeInsets.all(textPadding),
              child: Center(
                child: GtText(
                  text: label,
                  textStyle: textStyle,
                ),
              )),
          GtImageCard(
            height: imageheight,
            width: imageWidth,
            boxFit: boxFit,
            imageURL: imageURL,
            backgroundcolor: imageBackgroundColor,
            isNetworkImage: isNetworkImage,
          ),
        ]);
        break;
      default:
        return Container();
        break;
    }
  }
}
