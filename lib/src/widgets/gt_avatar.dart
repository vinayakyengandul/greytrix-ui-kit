import 'package:flutter/material.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

class GtAvatar extends StatelessWidget {
  GtAvatar({
    this.radius = 15,
    this.backgroundColor = Colors.blue,
    this.childWidget,
    this.backGroundImage,
    this.isMultiple = false,
    this.listOfImg,
    this.imgShowCount = 2,
    this.textStyle,
    this.withFactor = 0.6,
  });

  final double radius;
  final Color backgroundColor;
  final Widget childWidget;
  final ImageProvider backGroundImage;
  final bool isMultiple;
  final List<String> listOfImg;
  final int imgShowCount;
  final TextStyle textStyle;
  final double withFactor;

  @override
  Widget build(BuildContext context) {
return isMultiple ? 
      ListView.builder(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
            itemCount: listOfImg.length == imgShowCount ? imgShowCount : imgShowCount + 1,
            itemBuilder: (context, index) {
              return Align(
                widthFactor: withFactor,
                child: CircleAvatar(
                  radius: radius,
                  backgroundColor: backgroundColor,
                  child: index <= imgShowCount - 1 ?
                  CircleAvatar(
                    radius: radius,
                    backgroundImage: listOfImg[index].toString() != "" ?  NetworkImage(listOfImg[index].toString())
                    : AssetImage('assets/images/no_profile.png',
                    package: 'greytrix_ui_kit'),
                  )
                  : GtText(text: '+' + (listOfImg.length - imgShowCount).toString(),
                        textStyle: textStyle == null ? TextStyle(fontSize: 21,fontWeight: FontWeight.w500,color: Colors.white,
                              letterSpacing: 0.5,fontStyle: FontStyle.normal,) : textStyle,
                        ),
                ),
              );
            })
    : CircleAvatar(
      backgroundColor: backgroundColor,
      backgroundImage: backGroundImage,
      radius: radius,
      child: childWidget,
    );
  }
}
