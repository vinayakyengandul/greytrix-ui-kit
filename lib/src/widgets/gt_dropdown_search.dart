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
    this.dropdownWidth,
    this.dropdownheight = 200,
    @required this.keyLabel,
    this.dropdownElevation = 1.0,
    this.dropDownBackgroundColor,
    this.dropDownShapeBorder,
    this.looupKeyVisibile = false,
    @required this.lookupFields,
    this.type = GtDropDownSearchIsCustom.DEFAULT,
    this.contentPadding,
    this.helperText,
    this.helperStyle,
    this.constraints,
    this.labelText,
    this.labelStyle,
    this.fillColor,
    this.border,
    this.overlayContextType = GtContextType.BuildContext,
    this.spacing = 55,
    this.suffixIconSplashRadius,
    this.isRequired = false,
    this.isReadOnly = false,
    this.overlayResultHeightCalculator,
    this.validationHandler,
    this.textInputType = TextInputType.text,
    this.enableTooltip = false,
  }) : assert((type == GtDropDownSearchIsCustom.CUSTOM &&
                itemDatawidget != null) ||
            (type == GtDropDownSearchIsCustom.DEFAULT && lookupFields != null));

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
  final Function(int index, dynamic obj, Function closeOnTapOverLay)
      itemDatawidget;

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
  final EdgeInsets contentPadding;
  final String helperText;
  final TextStyle helperStyle;
  final BoxConstraints constraints;
  final String labelText;
  final TextStyle labelStyle;
  final Color fillColor;
  final InputBorder border;

  ///TO IDENTIFY WHICH CONTEXT TYPE WILL BE USED FOR THE OVERLAY SHOW FOR DROPDOWN SEARCH RESULT
  final GtContextType overlayContextType;

  ///SPACING BETWEEN THE DROPDOWN TEXT FORM FIELD AND THE DROPDOWN RESULT
  final double spacing;

  //DROPDOWN TEXT FIELD SUFFIX ICON SPLASH RADIUS
  final double suffixIconSplashRadius;

  ///DROPDOWN SEARCH REQUIRED OPTION, IF PASSES IT WILL FIRE THE VALIDATION
  final bool isRequired;

  ///TO MAKE DROPDOWN SEARCH READONLY ALONG WITH ITS SUFFIX ICON
  final bool isReadOnly;

  ///IF CUSTOM HEIGHT NEEDS TO BE PASSED TO OVERLAY RESULT THEN PROVIDE THIS INPUT FUNCTION WHICH RETURNS THE CALCULATED HEIGHT
  final double Function() overlayResultHeightCalculator;

  ///SEARCH TEXT FORM FIELD VALIDATION HANDLER
  final String Function(dynamic) validationHandler;

  ///SEARCH FIELD TEXT INPUT TYPE
  final TextInputType textInputType;

  ///TO DISPLAY TOOLTIP TEXT ON THE DROPDOWN RESULT 
  final bool enableTooltip;

  @override
  Widget build(BuildContext context) {
    ///GETTING THE DROPDOWN SEARCH CONTROLLER INSTANE
    final controller = Get.put(
      DropDownSearchController(
        keyLabel: keyLabel,
        overlayContextType: overlayContextType,
      ),
      tag: keyLabel,
    );
    // OVERLAY BUILDER
    OverlayEntry overlayEntryBuilder() {
      return OverlayEntry(
        maintainState: true,
        builder: (context) {
          return Obx(
            () => Positioned(
              top: controller.dropTop.value,
              left: controller.dropLeft.value,
              width: dropdownWidth != null
                  ? dropdownWidth
                  : controller.getWidth() != null
                      ? controller.getWidth()
                      : 100,
              height: overlayResultHeightCalculator != null
                  ? overlayResultHeightCalculator()
                  : dropdownheight,
              child: Material(
                shape: dropDownShapeBorder,
                color: dropDownBackgroundColor,
                elevation: dropdownElevation,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      dropDownResult.value.length,
                      (index) {
                        return type == GtDropDownSearchIsCustom.CUSTOM &&
                                itemDatawidget != null
                            ? itemDatawidget(index, dropDownResult.value[index],
                                controller.closeOverLay)
                            : ListTile(
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: lookupFields.entries.map((e) {
                                    Widget _row = Row(
                                      children: [
                                        if (looupKeyVisibile) ...[
                                          GtText(
                                            text: '${e.key} :',
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.25,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                        ],
                                        GtText(
                                          text: Common.getValue(
                                              dropDownResult.value[index],
                                              e.value),
                                          textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.25,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ],
                                    );

                                    ///IF TOOLTIP IS ENABLED THEN ONLY TOOTIP TEXT WILL BE DISPLAYED FOR DROPDOWN RESULT
                                    if (enableTooltip == true) {
                                      return Tooltip(
                                          message:
                                              '${e.key} :${Common.getValue(dropDownResult?.value[index], e.value)}',
                                          child: _row);
                                    } else {
                                      return _row;
                                    }
                                  }).toList(),
                                ),
                                onTap: () {
                                  if (itemOnTapHandler != null)
                                    itemOnTapHandler(index);
                                  controller.closeOverLay();
                                },
                              );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    ///HANDLES THE DROPDOWN SUFFIX ICON SEARCH CLICK AND ON_EDITING_COMPLETE ENTER CLICK
    void onSearchHandler() {
      if (controller.isOpen.value) {
        controller.closeOverLay();
        controller.openOverLay(overlayEntryBuilder(), context, spacing);
      } else {
        controller.openOverLay(overlayEntryBuilder(), context, spacing);
      }
      if (suffixOnPressed != null) suffixOnPressed(textEditingController.text);
      if (dropDownResult.value.length == 0) {
        controller.closeOverLay();
      }
    }

    return Column(
      children: [
        Container(
          key: controller.key,
          child: GtTextFormField(
            textInputType: textInputType,
            isRequired: isRequired,
            focusNode: controller.focusNode,
            isReadOnly: isReadOnly,
            onEditingComplete: !isReadOnly
                ? () {
                    onSearchHandler();
                  }
                : null,
            onTapHandler: !isReadOnly
                ? () {
                    if (textFieldOnTapHandler != null) textFieldOnTapHandler();
                    if (controller.isOpen.value) {
                      controller.closeOverLay();
                      controller.openOverLay(
                          overlayEntryBuilder(), context, spacing);
                    } else {
                      controller.openOverLay(
                          overlayEntryBuilder(), context, spacing);
                    }
                    if (dropDownResult.value.length == 0) {
                      controller.closeOverLay();
                    }
                  }
                : null,
            fieldLabel: fieldLabel,
            textEditingController: textEditingController,
            inputDecoration: inputDecoration == null
                ? InputDecoration(
                    contentPadding: contentPadding,
                    helperText: helperText,
                    helperStyle: helperStyle,
                    constraints: constraints,
                    labelText: labelText,
                    labelStyle: labelStyle,
                    fillColor: fillColor,
                    suffixIcon: IconButton(
                      splashRadius: suffixIconSplashRadius,
                      icon:
                          suffixIcon != null ? suffixIcon : Icon(Icons.search),
                      onPressed: !isReadOnly
                          ? () {
                              onSearchHandler();
                            }
                          : null,
                    ),
                    border: border,
                  )
                : inputDecoration,
            onChangeHandler: (value) {
              if (!isReadOnly && onChangeHandler != null) {
                onChangeHandler(value);
              }
            },
            validationHandler: validationHandler,
          ),
        ),
      ],
    );
  }
}
