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
  }) : super(
          onSaved: (savedVal) {
            if (onSaveHandler != null) onSaveHandler(savedVal);
          },
          validator: (val) {
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
            return Column(
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
