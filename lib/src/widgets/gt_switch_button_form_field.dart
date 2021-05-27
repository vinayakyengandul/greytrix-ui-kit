import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'gt_text.dart';

class GtSwitchButtonFormField extends FormField<bool> {
  final Function(bool newValue) onChangedHandler;
  final Function(bool newValue) onSaveHandler;
  final String label;
  final bool switchValue;
  final bool isRequired;
  final Color switchactiveColor;

  GtSwitchButtonFormField({
    @required this.label,
    @required this.onChangedHandler,
    this.onSaveHandler,
    this.switchValue = false,
    this.isRequired = false,
    this.switchactiveColor,
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
                        activeColor: switchactiveColor ?? Colors.blueGrey,
                        onChanged: (changedVal) {
                          if (onChangedHandler != null) {
                            state.didChange(changedVal);
                            onChangedHandler(changedVal);
                          }
                        },
                      )
                    : Switch(
                        activeColor: switchactiveColor ?? Colors.blueGrey,
                        value: switchValue,
                        onChanged: (changedVal) {
                          if (onChangedHandler != null) {
                            state.didChange(changedVal);
                            onChangedHandler(changedVal);
                          }
                        },
                      )
                : Switch(
                    activeColor: switchactiveColor ?? Colors.blueGrey,
                    value: switchValue,
                    onChanged: (changedVal) {
                      if (onChangedHandler != null) {
                        state.didChange(changedVal);
                        onChangedHandler(changedVal);
                      }
                    },
                  );
            return Column(
              children: [
                GtText(
                  text: label,
                  //texttype: TextformatType.bodyText2,
                ),
                SizedBox(height: 5),
                _switchWidget,
              ],
            );
          },
        );
}
