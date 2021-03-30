import 'package:flutter/material.dart';

import 'gt_text.dart';

class GtComingSoon extends StatelessWidget {
  GtComingSoon();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
              child: Image(
            image: AssetImage(
              'assets/images/day67-dog-removebg.png',
              package: 'core',
            ),
          )),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: FittedBox(
                  child: GtText(
                    text: "Coming Soon",
                    //texttype: TextformatType.imageCaption
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
