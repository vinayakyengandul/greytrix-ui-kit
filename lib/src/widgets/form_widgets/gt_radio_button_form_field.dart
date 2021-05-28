import 'package:flutter/material.dart';
import '../../../greytrix_ui_kit.dart';

class GtRadioButtonFormField extends FormField<dynamic> {
  final Map<String, dynamic> displayMapFields;
  final dynamic selectedRadioButtonVal;
  final String label;
  final bool isRequired;
  final Function(bool isChecked, dynamic val) onChangedHandler;
  final Function(dynamic selctedValues) onSaveHandler;
  final Color activeColor;

  GtRadioButtonFormField(
      {@required this.displayMapFields,
      @required this.selectedRadioButtonVal,
      @required this.onChangedHandler,
      this.onSaveHandler,
      this.label,
      this.isRequired = false,
      this.activeColor})
      : super(
          onSaved: (savedVal) {
            if (onSaveHandler != null) onSaveHandler(selectedRadioButtonVal);
          },
          validator: (val) {
            if (isRequired && selectedRadioButtonVal == null) {
              return 'Select the Value for the $label';
            }
            return null;
          },
          initialValue: selectedRadioButtonVal,
          builder: (FormFieldState<dynamic> state) {
            List<Widget> _widgets = displayMapFields.entries
                .map(
                  (e) => Row(
                    children: [
                      Checkbox(
                        activeColor: activeColor ?? Colors.blueGrey,
                        value: selectedRadioButtonVal != null
                            ? selectedRadioButtonVal == e.value
                            : false,
                        onChanged: (onChangedVal) {
                          state.didChange(onChangedVal);
                          if (onChangedHandler != null)
                            onChangedHandler(onChangedVal, e.value);
                        },
                      ),
                      GtText(
                        text: e.key,
                        //texttype: TextformatType.bodyText2,
                      ),
                    ],
                  ),
                )
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
