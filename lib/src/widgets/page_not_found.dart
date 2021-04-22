import 'package:flutter/material.dart';
import '../../greytrix_ui_kit.dart';

class GtPageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: Image(
              image: AssetImage(
                'assets/images/page_not_found.png',
                package: 'greytrix_ui_kit',
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              child: Center(
                  child: FittedBox(
                      child: GtText(
                text: "Page not found",
                textStyle: TextStyle(
                  fontSize: 5 * (size.height / 100),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                  fontStyle: FontStyle.normal,
                ),
              )))),
        ],
      ),
    );
  }
}
