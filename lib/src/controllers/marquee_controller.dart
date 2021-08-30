import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

class MarqueeController extends GetxController with SingleGetTickerProviderMixin {
  MarqueeController({this.controller,this.scrollDuration, this.stopDuration, this.textList, this.textSpanList});

  // THIS MODEL CLASS FOR GET CURRENT INDEX
  final MarqueeModel controller;
  final Duration scrollDuration;
  final Duration stopDuration;
  RxDouble  percent = 0.0.obs;
  // CURRENT INDEX SHOWS
  RxInt current = 0.obs;
  // LIST OF TEXT
  final List<String> textList;
  final List<TextSpan> textSpanList;
  // VGET LIST OF TEXT
  List<String> get _textList => textList;
  List<TextSpan> get _textSpanList => textSpanList;
  // TIMER USED FOR SCROLL STOP
  Timer stopTimer;

  // Controller for scroll text
  AnimationController animationConroller;

  //POSTION MODEL GET RETURN POSITION
  MarqueeModel get controllerm => controller;

  @override
  void onInit() {
     super.onInit();
    animationConroller = AnimationController(vsync: this);
    stopTimer =
        Timer.periodic(stopDuration + scrollDuration, (timer) {
      next();
    });   
  }

  @override
  void dispose() {
    animationConroller.dispose();
    stopTimer.cancel();
    super.dispose();
  }

  // FOR SCROLL THE NEXT TEXT
  void next() {
    var listener = () {
      var value = animationConroller.value;
        percent.value = value;
        _refreshControllerValue();
    };

    animationConroller.addListener(listener);
    animationConroller
        .animateTo(1.0, duration: scrollDuration * (1 - percent.value))
        .then((t) {
      animationConroller.removeListener(listener);
      animationConroller.value = 0.0;
        percent.value = 0.0;
        current.value = nextPosition;
        _refreshControllerValue();
    });
  }

  // THIS IS USED FOR CONTROLLER VALUE REFRESH
  void _refreshControllerValue() {
    controller.position = current.value;
    if (percent > 0.5) {
      controller.position = nextPosition;
    }
  }
  // FOR USED POSTION OF NEXT TEXT
  int get nextPosition {
    List list;
    if (_textSpanList.isNotEmpty) {
      list = _textSpanList;
    } else {
      list = _textList;
    }

    var next = current.value + 1;
    if (next >= list.length) {
      next = 0;
    }
    return next;
  }
}