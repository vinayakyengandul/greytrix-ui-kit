import 'dart:async';
import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';

class MarqueeController extends GetxController with SingleGetTickerProviderMixin {
  MarqueeController({this.controller,this.scrollDuration, this.stopDuration, this.textList, this.textSpanList});

  final MarqueeModel controller;
  final Duration scrollDuration;
  final Duration stopDuration;
  RxDouble  percent = 0.0.obs;
  RxInt current = 0.obs;
  final List<String> textList;
  final List<TextSpan> textSpanList;
  List<String> get _textList => textList;
  List<TextSpan> get _textSpanList => textSpanList;

  Timer stopTimer;

  AnimationController animationConroller;

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

  void _refreshControllerValue() {
    controller.position = current.value;
    if (percent > 0.5) {
      controller.position = nextPosition;
    }
  }
  int get nextPosition {
    List list;
    if (_textSpanList.isNotEmpty) {
      list = _textSpanList;
    } else {
      list = _textList;
    }

    var next = current + 1;
    if (next >= list.length) {
      next.value = 0;
    }
    return next.value;
  }
}