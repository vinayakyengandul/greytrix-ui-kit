import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

class GtSignature extends StatelessWidget {
  GtSignature({
    this.color = Colors.black,
    this.strokeWidth = 2.0,
    this.changeColorOnPressed,
    this.changeStrokeWidthOnPressed,
    this.saveSignOnPressed,
    this.backgroundColor = Colors.white54,
    this.signaturePadBackgroundColor = Colors.white70,
    this.sign,
    this.signClearOnPressed,
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
                  color: color,
                  key: sign,
                  onSign: () {
                  
                  },
                  strokeWidth: strokeWidth,
                ),
              ),
              color: signaturePadBackgroundColor,
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  saveSignOnPressed != null ? MaterialButton(
                      color: Colors.green,
                      onPressed: ()  {
                        if(saveSignOnPressed != null) saveSignOnPressed();
                      },
                      child: Text("Save")): Container(),
                  signClearOnPressed != null ? MaterialButton(
                      color: Colors.grey,
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
                      onPressed: () {
                        if(changeColorOnPressed != null) changeColorOnPressed(color);
                      },
                      child: Text("Change color")): Container(),
                  changeStrokeWidthOnPressed  != null ?  MaterialButton(
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