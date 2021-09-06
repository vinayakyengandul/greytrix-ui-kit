import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../models/enums.dart';
import 'gt_image_card.dart';
import 'gt_text.dart';

class GtButton extends StatelessWidget {
  GtButton({
    this.buttonStyle,
    this.iconColor,
    this.iconPosition = GtPosition.PREFIX,
    this.iconSize,
    this.icondata,
    this.onPressed,
    this.text,
    this.textStyle,
    this.buttonType = GtButtonType.BUTTON,
    this.value,
    this.groupValue,
    this.onChanged,
    this.toggleable = false,
    this.activeColor,
    this.autofocus = false,
    this.imagebackgroundcolor,
    this.imageboxFit,
    this.imageheight,
    this.imageURL,
    this.imageonClick,
    this.imagewidth,
    this.borderRadius,
    this.color,
    this.disabledColor,
    this.padding,
  }) : assert(buttonType == GtButtonType.RADIO &&
                value != null &&
                groupValue &&
                onChanged != null ||
            buttonType != GtButtonType.RADIO);

  final String text;
  final TextStyle textStyle;
  final IconData icondata;
  final double iconSize;
  final Color iconColor;
  final ButtonStyle buttonStyle;
  final Function onPressed;
  final GtPosition iconPosition;
  final GtButtonType buttonType;

  // FOR CUPERTINO BUTTON
  final Color color;
  final Color disabledColor;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  //PARAMETERS FOR RADIO BUTTON
  final Function(dynamic) onChanged;
  final bool toggleable;
  final bool autofocus;
  final activeColor;
  final dynamic groupValue;
  final dynamic value;

  // PARAMETERS FOR IMAGE BUTTON
  final Color imagebackgroundcolor;
  final String imageURL;
  final BoxFit imageboxFit;
  final double imagewidth;
  final double imageheight;
  final Function imageonClick;

  @override
  Widget build(BuildContext context) {
    return (buttonType == GtButtonType.BUTTON)
        ? !kIsWeb
            ? Platform.isIOS
                ? CupertinoButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GtText(
                          text: text,
                          textStyle: textStyle,
                          position: iconPosition,
                          iconSize: iconSize,
                          iconColor: iconColor,
                          iconData: icondata,
                        ),
                      ],
                    ),
                    onPressed:()=> onPressed(),
                    color: color,
                    disabledColor: disabledColor ?? Theme.of(context).disabledColor,
                    padding: padding ?? EdgeInsets.all(16.0),
                    borderRadius:
                        borderRadius ?? BorderRadius.all(Radius.circular(8.0)),
                  )
                : ElevatedButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GtText(
                          text: text,
                          textStyle: textStyle,
                          position: iconPosition,
                          iconSize: iconSize,
                          iconColor: iconColor,
                          iconData: icondata,
                        ),
                      ],
                    ),
                    style: buttonStyle,
                        // ElevatedButton.styleFrom(
                        //   primary: Colors.teal,
                        //   onPrimary: Colors.white,
                        //   shape: const BeveledRectangleBorder(
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(5))),
                        // ),
                    onPressed: () => onPressed(),
                  )
            : ElevatedButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GtText(
                      text: text,
                      textStyle: textStyle,
                      position: iconPosition,
                      iconSize: iconSize,
                      iconColor: iconColor,
                      iconData: icondata,
                    ),
                  ],
                ),
                style: buttonStyle,
                    // ElevatedButton.styleFrom(
                    //   primary: Colors.teal,
                    //   onPrimary: Colors.white,
                    //   shape: const BeveledRectangleBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(5))),
                    // ),
                onPressed: () => onPressed(),
              )
        : (buttonType == GtButtonType.RADIO)
            ? Row(
                children: [
                  Radio(
                    value: value,
                    groupValue: groupValue,
                    onChanged: onChanged,
                    activeColor: activeColor,
                    toggleable: toggleable,
                    autofocus: autofocus,
                  ),
                  if (text != null)
                    GtText(
                      text: text,
                      textStyle: textStyle,
                    )
                ],
              )
            : InkWell(
                onTap: imageonClick ?? () => {},
                child: GtImageCard(
                  backgroundcolor: imagebackgroundcolor,
                  boxFit: imageboxFit,
                  height: imageheight,
                  imageURL: imageURL,
                  width: imagewidth,
                ));
  }
}
