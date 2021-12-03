import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:greytrix_ui_kit/src/controllers/dropdown_search_controller.dart';
import 'package:greytrix_ui_kit/src/widgets/gt_custom_popup.dart';
import '../../greytrix_ui_kit.dart';

class GtDropdownSearch extends StatelessWidget {
  GtDropdownSearch({
     @required this.textEditingController,
     this.inputDecoration,
     this.onChangeHandler,
     this.suffixIcon,
     this.suffixOnPressed,
     this.itemDatawidget,
     this.itemOnTapHandler,
     this.dropDownResult,
     this.fieldLabel = "",
     this.textFieldOnTapHandler,
     this.dropdownWidth = 100,
     this.dropdownheight = 200,
     @required this.keyLabel,
     this.dropdownElevation = 1.0,
     this.dropDownBackgroundColor,
     this.dropDownShapeBorder,
     this.looupKeyVisibile = false,
     @required this.lookupFields,
     this.type = GtDropDownSearchIsCustom.DEFAULT,
  }) : assert((type == GtDropDownSearchIsCustom.CUSTOM && itemDatawidget != null) || (type == GtDropDownSearchIsCustom.DEFAULT && lookupFields != null));

  final TextEditingController textEditingController;
  /// decoration input search
  final InputDecoration inputDecoration;
  /// On change Handler
  final Function(dynamic) onChangeHandler;
  /// Search Bar Icon
  final Icon suffixIcon;
  /// Search onPressed
  final Function(dynamic) suffixOnPressed;
  /// List item onTap Handler
  final Function(int) itemOnTapHandler;
  /// Custom Widget build
  final Function(int index,dynamic obj, Function closeOnTapOverLay) itemDatawidget;
  ///dropdownResult show after serach
  final RxList<dynamic> dropDownResult;
  /// field label
  final String fieldLabel;
  /// On tap on text field
  final Function textFieldOnTapHandler;
  final double dropdownWidth;
  final double dropdownheight;
  final String keyLabel;
  final double dropdownElevation;
  final Color dropDownBackgroundColor;
  final ShapeBorder dropDownShapeBorder;
  final Map<String, String> lookupFields;
  final bool looupKeyVisibile;
  final GtDropDownSearchIsCustom type;

  @override
  Widget build(BuildContext context){
    final controller = Get.put(DropDownSearchController(keyLabel: keyLabel),tag: keyLabel);
    OverlayEntry overlayEntryBuilder() {
    return OverlayEntry(
      maintainState: true,
      builder: (context) {
      return Positioned(
        top: controller.dropTop.value,
        left: controller.dropLeft.value,
        width: dropdownWidth,
        height: dropdownheight,
        child: Material(
          shape: dropDownShapeBorder,
          color: dropDownBackgroundColor,
          elevation: dropdownElevation,
          child: SingleChildScrollView(
              child: Obx(() => Column(
                  children: List.generate(dropDownResult.value.length, (index) { 
                   return type == GtDropDownSearchIsCustom.CUSTOM && itemDatawidget != null ? itemDatawidget(index, dropDownResult.value[index], controller.closeOverLay) :
                   ListTile(
                        title: Column( 
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: lookupFields.entries
                              .map((e) => Row(
                                    children: [
                                      if (looupKeyVisibile) ...[
                                        GtText(
                                          text: '${e.key} :',
                                          textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.25,
                                              fontStyle: FontStyle.normal,),
                                        ),
                                      ],
                                      GtText(
                                        text: Common.getValue(dropDownResult.value[index], e.value),
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.25,
                                            fontStyle: FontStyle.normal,),
                                      ),
                                    ],
                                  ))
                              .toList(),
                        ),
                        onTap: () {
                          if(itemOnTapHandler != null) itemOnTapHandler(index);
                          controller.closeOverLay();
                      },
                      );
                    }
                  //   ListTile(
                  //     title: GtText(text: dropDownResult.value[index].toString()),
                  //     onTap: () {
                  //       if(itemOnTapHandler != null) itemOnTapHandler(index);
                  //       controller.closeOverLay();
                  //     },
                  //   );
                  // }
              )),
                ),
              ),
          )
        );
      },
    );
  }

    return Column(
        children: [
          Container(
            key: controller.key,
            child: GtTextFormField(
              focusNode: controller.focusNode,
              onTapHandler: (){
                if(textFieldOnTapHandler != null) textFieldOnTapHandler();
                if (controller.isOpen.value) {
                      controller.closeOverLay();
                      controller.openOverLay(overlayEntryBuilder(), context);
                    } else {
                      controller.openOverLay(overlayEntryBuilder(), context);
                    }
                    if(dropDownResult.value.length == 0){
                      controller.closeOverLay();
                    }
              },
              fieldLabel: fieldLabel,
              textEditingController: textEditingController,
              inputDecoration: inputDecoration == null ? InputDecoration(
                suffixIcon: IconButton(
                  icon: suffixIcon != null ? suffixIcon : Icon(Icons.search),
                  onPressed: (){
                    if (controller.isOpen.value) {
                      controller.closeOverLay();
                      controller.openOverLay(overlayEntryBuilder(), context);
                    } else {
                      controller.openOverLay(overlayEntryBuilder(), context);
                    }
                    if(suffixOnPressed != null) suffixOnPressed(textEditingController.text);
                    if(dropDownResult.value.length == 0){
                      controller.closeOverLay();
                    }
                  },
                  ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.circular(21),
                ),
              ) : inputDecoration,
              
              onChangeHandler: (value){
                if(onChangeHandler != null) onChangeHandler(value);
              },
            ),
          ),
        ],
    );
  }

}