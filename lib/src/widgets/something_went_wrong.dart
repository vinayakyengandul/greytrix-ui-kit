import 'package:flutter/material.dart';
import '../../greytrix_ui_kit.dart';

class GtSomethingWentWrong extends StatelessWidget {
  GtSomethingWentWrong({
    this.message,
  });

  final String message;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: Image(
              image: AssetImage(
                'assets/images/Something_went_wrong.png',
                package: 'greytrix_ui_kit',
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              child: Center(
                  child: FittedBox(
                      child: GtText(
                text: message == null
                    ? "Something Went Wrong !! Please Try Again."
                    : message,
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
