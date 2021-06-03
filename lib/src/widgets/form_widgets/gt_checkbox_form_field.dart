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

  GtCheckboxFormField(
      {@required this.displayMapFields,
      @required this.selectedCheckboxValues,
      @required this.onChangedHandler,
      this.onSaveHandler,
      this.label,
      this.isRequired = false,
      this.activeColor})
      : super(
          initialValue: selectedCheckboxValues,
          onSaved: (savedVal) {
            if (onSaveHandler != null) onSaveHandler(selectedCheckboxValues);
          },
          validator: (val) {
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
                          activeColor: activeColor ?? Colors.blueGrey,

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
                          //texttype: TextformatType.bodyText2,
                        ),
                      ],
                    ))
                .toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GtText(
                  text: label,
                  //texttype: TextformatType.bodyText2,
                ),
                Container(
                  child: Wrap(
                    children: [..._widgets],
                  ),
                ),
              ],
            );
          },
        );
}