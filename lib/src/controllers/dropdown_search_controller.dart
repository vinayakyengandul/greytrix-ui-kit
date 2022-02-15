import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/index.dart';

class DropDownSearchController extends GetxController {
  DropDownSearchController({
    @required this.keyLabel,
    this.overlayContextType = GtContextType.BuildContext,
  });

  final String keyLabel;

  ///TO IDENTIFY WHICH CONTEXT TYPE WILL BE USED FOR THE OVERLAY SHOW FOR DROPDOWN SEARCH RESULT
  final GtContextType overlayContextType;
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
    BuildContext buildContext;
    try {
      ///HERE IF SETTING BUILD CONTEXT BASED ON INPUT PROVIDED TO OPEN THE OVERLAY VIEW
      if (this.overlayContextType == GtContextType.BuildContext) {
        buildContext = context;
      } else {
        buildContext = Get.context;
      }
      if (buildContext != null) {
        Overlay.of(buildContext).insert(overlayEntry.value);
      }
    } catch (e) {
      BuildContext _buildContext;
      ///HERE ON ERRRO SETTING DIFFERENT BUILD CONTEXT BASED ON INPUT PROVIDED
      ///i.e. if GetContext provided but error occured then setting context as BuildContext
      try {
        if (this.overlayContextType == GtContextType.BuildContext) {
          _buildContext = Get.context;
        } else {
          _buildContext = context;
        }
        if (_buildContext != null) {
          Overlay.of(_buildContext).insert(overlayEntry.value);
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
