import 'package:flutter/material.dart';

class GtTextFormField extends StatelessWidget {
  GtTextFormField(
      {@required this.fieldLabel = "",
      this.maxLength,
      this.maxLines = 1,
      this.minLines = 1,
      this.isReadOnly = false,
      this.textEditingController,
      this.textInputType = TextInputType.text,
      this.isRequired = false,
      this.onChangeHandler,
      this.padding = const EdgeInsets.all(0.0),
      this.obscureText = false,
      this.onSaveHandler,
      this.chips,
      this.prefixIcon,
      this.labeltextStyle,
      this.textStyle,
      this.onTapHandler});
  final int maxLength;
  final int maxLines;
  final int minLines;
  final bool isReadOnly;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String fieldLabel;
  final bool isRequired;
  final Function(dynamic val) onChangeHandler;
  final Function(dynamic val) onSaveHandler;
  final Function onTapHandler;
  final EdgeInsets padding;
  final bool obscureText;
  final Icon prefixIcon;
  final TextStyle labeltextStyle;
  final Widget chips;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        obscureText: obscureText,
        maxLength: maxLength,
        minLines: maxLines,
        maxLines: maxLines,
        readOnly: isReadOnly,
        controller: textEditingController,
        style: textStyle,
        keyboardType: textInputType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 10),
          labelText: '$fieldLabel',
          labelStyle: labeltextStyle,
          suffix: chips,
          icon: prefixIcon,
        ),
        onChanged: (value) =>
            {if (onChangeHandler != null) onChangeHandler(value)},
        onSaved: (value) => {
          if (onSaveHandler != null) {onSaveHandler(value)}
        },
        validator: (value) {
          if (isRequired) {
            if (value.isEmpty) {
              return 'Enter the value for $fieldLabel field';
            }
            try {
              if (textEditingController != null)
                textEditingController.text = value.toString();
            } catch (e) {}
          }
          return null;
        },
        onTap: () {
          if (onTapHandler != null) onTapHandler();
        },
      ),
    );
  }
}
