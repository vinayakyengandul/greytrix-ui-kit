import 'package:flutter/material.dart';
import '../../../greytrix_ui_kit.dart';

class GtCheckboxFormField extends FormField<List<dynamic>> {
  final Map<String, dynamic> displayMapFields;
  final dynamic selectedCheckboxValues;
  final String label;
  final bool isRequired;
  final Function(bool isChecked, dynamic val) onChangedHandler;
  final Function(List<dynamic> selctedValues) onSaveHandler;
  final Color activeColor;
  final TextStyle textStyle;
  final bool validationMessage;
  /// Validation function Handler
  final Function(dynamic) validationHandler;
  

  GtCheckboxFormField(
      {@required this.displayMapFields,
      @required this.selectedCheckboxValues,
      @required this.onChangedHandler,
      this.onSaveHandler,
      this.label,
      this.isRequired = false,
      this.textStyle,
      this.validationMessage = true,
      this.activeColor,
      this.validationHandler})
      : super(
          initialValue: selectedCheckboxValues,
          onSaved: (savedVal) {
            if (onSaveHandler != null) onSaveHandler(selectedCheckboxValues);
          },
          validator: validationHandler != null ? validationHandler :  (val) {
            if (isRequired && selectedCheckboxValues.length < 1) {
              return 'Select the Value for the $label';
            }
            return null;
          },
          builder: (FormFieldState<List<dynamic>> state) {
            List<Widget> _widgets = displayMapFields.entries
                .map((e) => Row(
                      children: [
                        Checkbox(
                          activeColor: activeColor,

                          ///CHECKINF IF SELCTED ITEMS CONTAINS THE VALUE REQUESTED
                          value: selectedCheckboxValues != null
                              ? selectedCheckboxValues.contains(e.value)
                              : false,
                          onChanged: (onChangedVal) {
                            state.didChange([onChangedVal]);
                            if (onChangedHandler != null)
                              onChangedHandler(onChangedVal, e.value);
                          },
                        ),
                        GtText(
                          text: e.key,
                          textStyle: textStyle
                          //texttype: TextformatType.bodyText2,
                        ),
                      ],
                    ))
                .toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                GtText(
                  text: label,
                  textStyle: textStyle,
                  //texttype: TextformatType.bodyText2,
                ),
                isRequired  && !validationMessage ? GtText(
                  text: " *",
                  textStyle: TextStyle(color: Colors.red),
                  //texttype: TextformatType.bodyText2,
                ): Container(),
                ]),
                Container(
                  child: Wrap(
                    children: [..._widgets],
                  ),
                ),
                state.errorText == null || !validationMessage
                    ? Container()
                    : GtText(text:state.errorText, textStyle: TextStyle(color: Colors.red,fontSize: 11.5))
              ],
            );
          },
        );
}
