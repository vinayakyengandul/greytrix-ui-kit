import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownSearchController extends GetxController {
  DropDownSearchController({@required this.keyLabel});

  final String keyLabel;
  Rx<OverlayEntry> overlayEntry = new Rx<OverlayEntry>(OverlayEntry(builder: (context) {return Text("");}));
  Rx<bool> isOpen = new Rx<bool>(false);
  Rx<double> dropLeft = new Rx<double>(50);
  Rx<double> dropTop = new Rx<double>(50);
  GlobalKey key;
  @override
  void onInit() {
    key = LabeledGlobalKey(keyLabel);
    super.onInit();
  }

  openOverLay(OverlayEntry data, BuildContext context){
    RenderBox box = key.currentContext.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    dropTop.value = position.dy + 55;
    dropLeft.value = position.dx;
    overlayEntry.value = data;
    Overlay.of(context).insert(overlayEntry.value);
    isOpen.value = !isOpen.value;
  }
  closeOverLay(){
    overlayEntry.value.remove();
    isOpen.value = !isOpen.value;
  }

 
}