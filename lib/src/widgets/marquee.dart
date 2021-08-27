import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../greytrix_ui_kit.dart';
import '../controllers/marquee_controller.dart';

class GtMarquee extends StatelessWidget {
  final List<String> textList;
  final List<TextSpan> textSpanList;
  final double fontSize;
  final Color textColor;
  final Duration scrollDuration;
  final Duration stopDuration;
  final bool tapToNext;
  final MarqueeModel controllerMar;
  
  GtMarquee({
    Key key,
    this.textList = const [],
    this.textSpanList = const [],
    this.fontSize = 14.0,
    this.textColor = Colors.black,
    this.scrollDuration = const Duration(seconds: 1),
    this.stopDuration = const Duration(seconds: 3),
    this.tapToNext = false,
    this.controllerMar,
  }) : assert(!(textList.isNotEmpty && textSpanList.isNotEmpty),
        "textList and textSpanList cannot have elements at the same time.",), super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MarqueeController(
      controller: controllerMar,
      scrollDuration: scrollDuration,
      stopDuration: stopDuration,
      textList: textList,
      textSpanList: textSpanList,
    ));
    if (textList.length == 1) {
      return Center(
        child: Text(
          textList[0],
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      );
    }

    if (textSpanList.length == 1) {
      return Center(
        child: Text.rich(
          textSpanList[0],
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      );
    }
    Widget _widget = Obx(() => ClipRect(
      child:  CustomPaint(
        child: Container(),
        painter: _MarqueePainter(
          textList,
          textSpanList: textSpanList,
          fontSize: fontSize,
          textColor: textColor,
          verticalSpace: 0.0,
          percent: controller.percent.value,
          current: controller.current.value,
          nextPostion: controller.nextPosition,
        ),
      ),
    ));
    if (tapToNext) {
      _widget = GestureDetector(
        onTap: controller.next,
        child: _widget,
      );
    }

    return _widget;
  }
}
class _MarqueePainter extends CustomPainter {
  List<String> textList;
  List<TextSpan> textSpanList;
  double verticalSpace;
  double fontSize;
  Color textColor;
  int nextPostion;

  int current = 0;

  double percent = 0.0;

  _MarqueePainter(
    this.textList, {
    this.textSpanList,
    this.fontSize,
    this.textColor,
    this.verticalSpace,
    this.percent = 0.0,
    this.current,
    this.nextPostion,
  });

  TextPainter textPainter = TextPainter(
    textDirection: TextDirection.ltr,
    textAlign: TextAlign.center,
  );

  @override
  void paint(Canvas canvas, Size size) {
    _paintCurrent(size, canvas);
    _paintNext(size, canvas);
  }

  TextSpan getTextSpan(int position) {
    if (textSpanList.isNotEmpty) {
      return textSpanList[position];
    }

    String text = textList[position];
    return TextSpan(
      text: text,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
      ),
    );
  }

  void _paintCurrent(Size size, Canvas canvas) {
    textPainter.text = getTextSpan(current);
    textPainter.textAlign = TextAlign.center;
    textPainter.maxLines = 1;
    textPainter.ellipsis = "...";

    textPainter.layout(maxWidth: size.width);
    textPainter.paint(canvas, _getTextOffset(textPainter, size));
    print(_paintCurrent);
    print(textPainter.text);
  }

  _paintNext(Size size, Canvas canvas) {
    textPainter.text = getTextSpan(nextPostion);
    textPainter.textAlign = TextAlign.center;
    textPainter.maxLines = 1;
    textPainter.ellipsis = "...";

    textPainter.layout(maxWidth: size.width);
    textPainter.paint(canvas, _getTextOffset(textPainter, size, isNext: true));
    print("_paintNext");
    print(textPainter.text);
  }

  Offset _getTextOffset(
    TextPainter textPainter,
    Size size, {
    bool isNext = false,
  }) {
    var width = textPainter.width;
    if (width >= size.width) {
      width = size.width;
    }
    var height = textPainter.height;
    var dx = size.width / 2 - width / 2;
    var dy = size.height / 2 - height / 2 - size.height * percent;
    if (isNext) {
      dy = dy + size.height;
    }
    return Offset(dx, dy);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}