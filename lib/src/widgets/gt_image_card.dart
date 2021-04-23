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
      height: height ?? 70.0,
      width: width ?? 80.0,
      color: backgroundcolor != null ? backgroundcolor : Colors.grey.shade200,
      child: Image.network(
        '$imageURL',
        fit: boxFit ?? BoxFit.fill,

        ///SHOWS THE LOADER TILL IMAGE IS LOADED COMPLETELY
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: SizedBox(
              height: 200.0,
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ),
              ),
            ),
          );
        },

        ///HANDLES ERROR OCCURRED DURING FETCHING OR LOADING THE IMAGE AND SHOWS NO_PREVIEW_TEXT
        errorBuilder:
            (BuildContext context, Object exception, StackTrace stackTrace) {
          return Image.asset(
            "assets/images/no_image_available.png",
            package: 'greytrix_ui_kit',
          );
        },
      ),
    );
  }
}
