import 'package:flutter/material.dart';

class GtImageCard extends StatelessWidget {
  GtImageCard({
    this.boxFit = BoxFit.fill,
    this.imageURL,
    this.backgroundcolor,
    this.height,
    this.width,
  });

  final Color backgroundcolor;
  final String imageURL;

  final BoxFit boxFit;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2.0),
        width: (MediaQuery.of(context).size.width) / 3,
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8, left: 0, top: 8, bottom: 2),
            width: width != null ? width : 70,
            height: height != null ? height : 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                color: backgroundcolor != null
                    ? backgroundcolor
                    : Colors.blue.shade200,
                image: DecorationImage(
                  fit: boxFit,
                  image: imageURL != null
                      ? NetworkImage(imageURL)
                      : AssetImage(
                          "assets/images/no_image_available.png",
                          package: 'greytrix_ui_kit',
                        ),
                )),
          )
        ]));
  }
}
