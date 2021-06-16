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
  final TextStyle textStyle;
  final bool validationMessage;

  GtRadioButtonFormField(
      {@required this.displayMapFields,
      @required this.selectedRadioButtonVal,
      @required this.onChangedHandler,
      this.onSaveHandler,
      this.label,
      this.isRequired = false,
      this.textStyle,
      this.validationMessage = true,
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
                      Radio(
                        activeColor: activeColor ?? Colors.blueGrey,
                        groupValue: selectedRadioButtonVal,
                        onChanged: (onChangedVal) {
                          state.didChange(onChangedVal);
                          if (onChangedHandler != null)
                            onChangedHandler(onChangedVal == e.value ? true: false,e.value);
                        },
                        value: e.value,
                      ),
                      GtText(
                        text: e.key,
                        textStyle: textStyle,
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
