import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownSearchController extends GetxController {
  DropDownSearchController({@required this.keyLabel});

  final String keyLabel;
  Rx<OverlayEntry> overlayEntry =
      new Rx<OverlayEntry>(OverlayEntry(builder: (context) {
    return Text("");
  }));
  Rx<bool> isOpen = new Rx<bool>(false);
  Rx<double> dropLeft = new Rx<double>(50);
  Rx<double> dropTop = new Rx<double>(50);

  /// TEXT FIELD FOCUS NODE
  final FocusNode focusNode = FocusNode();
  GlobalKey key;
  @override
  void onInit() {
    key = LabeledGlobalKey(keyLabel);

    /// Focus node add Listener for focus and unfocus conditions
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
      } else {
        if (isOpen.value) closeOverLay();
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    /// Focus node dispose
    focusNode.dispose();
    super.dispose();
  }

  /// Open OverLayEntry and Get position from RenderBox
  openOverLay(OverlayEntry data, BuildContext context) {
    RenderBox box = key.currentContext.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    dropTop.value = position.dy + 55;
    dropLeft.value = position.dx;
    overlayEntry.value = data;
    try {
      BuildContext buildContext = context ?? Get.context;
      if (buildContext != null) {
        Overlay.of(buildContext).insert(overlayEntry.value);
      }
    } catch (e) {
      //If ANY ERROR OCCURED WITH NORMAL WIDGET CONTEXT THEN TRYING WITH GET.CONTEXT
      try {
        BuildContext buildContext = Get.context ?? context;
        if (buildContext != null) {
          Overlay.of(buildContext).insert(overlayEntry.value);
        }
      } catch (ce) {
        print('Error Inside openOverLay fn for dropdown search controller.');
        print(ce);
      }
    }
    isOpen.value = !isOpen.value;
  }

  closeOverLay() {
    overlayEntry.value.remove();
    isOpen.value = !isOpen.value;
  }
}
