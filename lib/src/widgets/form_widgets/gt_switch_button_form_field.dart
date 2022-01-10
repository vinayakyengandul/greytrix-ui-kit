import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../greytrix_ui_kit.dart';

class GtSwitchButtonFormField extends FormField<bool> {
  final Function(bool newValue) onChangedHandler;
  final Function(bool newValue) onSaveHandler;
  final String label;
  final bool switchValue;
  final bool isRequired;
  final Color switchactiveColor;
  final TextStyle textStyle;
  final bool validationMessage;
  final CrossAxisAlignment crossAxisAlignment;
  /// Validation function Handler
  final Function(dynamic) validationHandler;
  final bool isRow;
  final int expandedFlexText;
  final int expandedFlexButton;
  final Alignment switchAlignment;

  GtSwitchButtonFormField({
    @required this.label,
    @required this.onChangedHandler,
    this.onSaveHandler,
    this.switchValue = false,
    this.isRequired = false,
    this.switchactiveColor,
    this.textStyle,
    this.validationMessage = true,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.validationHandler,
    this.isRow = false,
    this.expandedFlexText = 1,
    this.expandedFlexButton = 1,
    this.switchAlignment = Alignment.centerLeft,
  }) : super(
          onSaved: (savedVal) {
            if (onSaveHandler != null) onSaveHandler(savedVal);
          },
          validator: validationHandler != null ? validationHandler :  (val) {
            if (isRequired && val == null) {
              return 'Select at least one value for $label';
            }
            return null;
          },
          initialValue: switchValue,
          builder: (FormFieldState<bool> state) {
            Widget _switchWidget = !kIsWeb
                ? Platform.isIOS
                    ? CupertinoSwitch(
                        value: switchValue,
                        activeColor: switchactiveColor,
                        onChanged: (changedVal) {
                          if (onChangedHandler != null) {
                            state.didChange(changedVal);
                            onChangedHandler(changedVal);
                          }
                        },
                      )
                    : Switch(
                        activeColor: switchactiveColor,
                        value: switchValue,
                        onChanged: (changedVal) {
                          if (onChangedHandler != null) {
                            state.didChange(changedVal);
                            onChangedHandler(changedVal);
                          }
                        },
                      )
                : Switch(
                    activeColor: switchactiveColor,
                    value: switchValue,
                    onChanged: (changedVal) {
                      if (onChangedHandler != null) {
                        state.didChange(changedVal);
                        onChangedHandler(changedVal);
                      }
                    },
                  );
            return isRow ? Row(
              crossAxisAlignment: crossAxisAlignment,
              children: [
                Expanded(
                  flex: expandedFlexText,
                  child: GtText(
                    text: label,
                    textStyle: textStyle,
                    //texttype: TextformatType.bodyText2,
                  ),
                ),
                isRequired && !validationMessage ? GtText(
                  text: " *",
                  textStyle: TextStyle(color: Colors.red),
                  //texttype: TextformatType.bodyText2,
                ): Container(),
                Expanded(
                  flex: expandedFlexButton,
                  child: Align(
                    alignment: switchAlignment,
                    child: _switchWidget)),
                 state.errorText == null || !validationMessage
                    ? Container()
                    : GtText(text:state.errorText, textStyle: TextStyle(color: Colors.red,fontSize: 11.5))
              ],
            ) : Column(
              crossAxisAlignment: crossAxisAlignment,
              children: [
                Wrap(children: [
                  GtText(
                    text: label,
                    textStyle: textStyle,
                    //texttype: TextformatType.bodyText2,
                  ),
                  isRequired && !validationMessage ? GtText(
                    text: " *",
                    textStyle: TextStyle(color: Colors.red),
                    //texttype: TextformatType.bodyText2,
                  ): Container(),
                ]),
                SizedBox(height: 5),
                _switchWidget,
                 state.errorText == null || !validationMessage
                    ? Container()
                    : GtText(text:state.errorText, textStyle: TextStyle(color: Colors.red,fontSize: 11.5))
              ],
            );
          },
        );
}
