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
  final int textLine;
  
  GtMarquee({
    Key key,
    this.textList = const [],
    this.textSpanList = const [],
    this.fontSize = 14.0,
    this.textColor,
    this.scrollDuration = const Duration(seconds: 1),
    this.stopDuration = const Duration(seconds: 3),
    this.tapToNext = false,
    this.controllerMar,
    this.textLine = 1,
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
    if (controller.textList.length == 1) {
      return Center(
        child: GtText(
          text: controller.textList[0],
          textStyle: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      );
    }
    if (controller.textSpanList.length == 1) {
      return Center(
        child: Text.rich(
          controller.textSpanList[0],
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
          controller.textList,
          textSpanList: textSpanList,
          fontSize: fontSize,
          textColor: textColor,
          verticalSpace: 0.0,
          percent: controller.percent.value,
          current: controller.current.value,
          nextPostion: controller.nextPosition,
          textLine: textLine,
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
  int textLine;
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
    this.textLine,
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
    textPainter.maxLines = textLine;
    textPainter.ellipsis = "...";

    textPainter.layout(maxWidth: size.width);
    textPainter.paint(canvas, _getTextOffset(textPainter, size));
  }

  _paintNext(Size size, Canvas canvas) {
    textPainter.text = getTextSpan(nextPostion);
    textPainter.textAlign = TextAlign.center;
    textPainter.maxLines = textLine;
    textPainter.ellipsis = "...";

    textPainter.layout(maxWidth: size.width);
    textPainter.paint(canvas, _getTextOffset(textPainter, size, isNext: true));
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
