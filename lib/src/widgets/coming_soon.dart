import 'package:flutter/material.dart';

import 'gt_text.dart';

class GtComingSoon extends StatelessWidget {
  GtComingSoon();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
              child: Image(
            image: AssetImage(
              'assets/images/day67-dog-removebg.png',
              package: 'greytrix_ui_kit',
            ),
          )),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: FittedBox(
                  child: GtText(
                    text: "Coming Soon",
                    textStyle: TextStyle(fontSize: 5 * (size.height / 100)),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
