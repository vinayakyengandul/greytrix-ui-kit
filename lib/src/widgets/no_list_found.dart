import 'package:flutter/material.dart';
import '../../greytrix_ui_kit.dart';

class GtNoListFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: Image(
              image: AssetImage(
                'assets/images/No_list_found.png',
                package: 'core',
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              child: Center(
                  child: FittedBox(
                      child: GtText(
                text: "No Records Found",
                //texttype: TextformatType.imageCaption
                textStyle: TextStyle(
                  fontSize: 35,
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
