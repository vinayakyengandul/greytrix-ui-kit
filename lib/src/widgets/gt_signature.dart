import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

class GtSignature extends StatelessWidget {
  GtSignature({
    this.color,
    this.strokeWidth = 2.0,
    this.changeColorOnPressed,
    this.changeStrokeWidthOnPressed,
    this.saveSignOnPressed,
    this.backgroundColor,
    this.signaturePadBackgroundColor,
    this.sign,
    this.signClearOnPressed,
    this.clearSignButtonColor,
    this.saveSignButtonColor,
    this.changeColor,
    this.changeStrokeWidth
  });
  final Color color;
  final double strokeWidth;
  final Function(Color color) changeColorOnPressed;
  final Function changeStrokeWidthOnPressed;
  final Function saveSignOnPressed;
  final Color backgroundColor;
  final Color signaturePadBackgroundColor;
  final GlobalKey<SignatureState> sign;
  final Function signClearOnPressed;
  final Color saveSignButtonColor;
  final Color clearSignButtonColor;
  final Color changeColor;
  final Color changeStrokeWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Signature(
                  color: color ?? Theme.of(context).textTheme.bodyText1.color,
                  key: sign,
                  onSign: () {
                  
                  },
                  strokeWidth: strokeWidth,
                ),
              ),
              color: signaturePadBackgroundColor ?? Theme.of(context).disabledColor.withOpacity(0.2),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  saveSignOnPressed != null ? MaterialButton(
                      color: saveSignButtonColor ?? Theme.of(context).buttonColor,
                      onPressed: ()  {
                        if(saveSignOnPressed != null) saveSignOnPressed();
                      },
                      child: Text("Save")): Container(),
                  signClearOnPressed != null ? MaterialButton(
                      color: clearSignButtonColor ?? Theme.of(context).buttonColor,
                      onPressed: () {
                        signClearOnPressed();
                      },
                      child: Text("Clear")) : Container(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  changeColorOnPressed  != null ?  MaterialButton(
                      color: changeColor ?? Theme.of(context).buttonColor,
                      onPressed: () {
                        if(changeColorOnPressed != null) changeColorOnPressed(color);
                      },
                      child: Text("Change color")): Container(),
                  changeStrokeWidthOnPressed  != null ?  MaterialButton(
                    color: changeStrokeWidth ?? Theme.of(context).buttonColor,
                      onPressed: () {
                        if(changeStrokeWidthOnPressed != null) changeStrokeWidthOnPressed();
                      },
                      child: Text("Change stroke width")): Container(),
                ],
              ),
            ],
          )
        ],
    ));
  }
}