import 'package:flutter/material.dart';
import '../../greytrix_ui_kit.dart';

class GtNoListFound extends StatelessWidget {
  GtNoListFound({this.text = "No Records Found"});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: Image(
              image: AssetImage(
                'assets/images/No_list_found.png',
                package: 'greytrix_ui_kit',
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              child: Center(
                  child: FittedBox(
                      child: GtText(
                text: text,
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
