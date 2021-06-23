import 'package:flutter/material.dart';
import '../../../greytrix_ui_kit.dart';

class GtDropdownFormField extends StatelessWidget {
  GtDropdownFormField({
    this.iconData,
    this.items,
    this.dropdownValue,
    this.onChangedhandler,
    this.onSavehandler,
    this.isRequired = false,
    this.label,
    this.textStyle,
    this.dropDownBackGround,
    this.valueTextStyle,
  });

  final IconData iconData;
  final Map<String, dynamic> items;
  final dynamic dropdownValue;
  final Function(dynamic newValue) onChangedhandler;
  final Function(dynamic newValue) onSavehandler;
  final bool isRequired;
  final String label;
  final TextStyle textStyle;
  final TextStyle valueTextStyle;
  final Color dropDownBackGround;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (label != null)
              ? GtText(
                  text: label,
                  textStyle: textStyle,
                  //texttype: TextformatType.bodyText2,
                )
              : SizedBox(),
          DropdownButtonFormField(
            value: dropdownValue,
            dropdownColor: dropDownBackGround,
            icon: GtIcon(icondata: iconData),
            iconSize: 24,
            elevation: 16,
            onChanged: onChangedhandler,
            items: items.entries
                .map(
                  (e) => DropdownMenuItem<dynamic>(
                    value: e.value,
                    child: GtText(
                      text: e.key,
                      textStyle: valueTextStyle
                      //texttype: TextformatType.bodyText2,
                    ),
                  ),
                )
                .toList(),
            onSaved: onSavehandler,
            validator: (dynamic value) {
              if (isRequired == true && value == null) {
                return 'Please select atleast one option';
              } else {}

              return null;
            },
          )
        ],
      ),
    );
  }
}
