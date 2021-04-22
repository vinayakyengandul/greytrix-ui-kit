import 'package:flutter/material.dart';

class GtProgressBar extends StatelessWidget {
  GtProgressBar();

  // final IconData icondata;
  // final double size;
  // final Color color;
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.blue,
      value: 40,
    );
  }
}
