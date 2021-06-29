import 'package:flutter/material.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'gt_text_form_field.dart';

class GtDate extends StatelessWidget {
  final GtDateTimeType type;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Icon prefixDateIcon;
  final String label;
  final TextStyle labeltextStyle;
  final TextStyle datetextStyle;
  final TextStyle timetextStyle;
  final String datefieldLabel;
  final String timefieldLabel;
  final bool isRequired;
  final String cancelText;
  final String confirmText;
  final ThemeData themeData;
  final Function(dynamic val, GtDateTimeType type, dynamic date)
      onDateSubmitted;
  final Function(dynamic val, GtDateTimeType type) onSaveHandler;
  final TextEditingController dateTextEditingController;
  final TextEditingController timeTextEditingController;
  final DatePickerMode initialEntryMode;
  final DatePickerEntryMode datePickerEntryMode;
  final Color iconColor;
  final TextStyle selectedTextStyle;
  final Icon prefixTimeIcon;
  final Icon suffixDateIcon;
  final Icon suffixTimeIcon;
  final bool isReadOnly;
  final String dateFormat;
  GtDate({
    this.type = GtDateTimeType.BOTH,
    @required this.label,
    @required this.initialDate,
    this.firstDate,
    this.lastDate,
    this.prefixDateIcon,
    this.isRequired = false,
    this.onDateSubmitted,
    this.onSaveHandler,
    this.dateTextEditingController,
    this.timeTextEditingController,
    this.datePickerEntryMode = DatePickerEntryMode.calendar,
    this.initialEntryMode = DatePickerMode.day,
    this.labeltextStyle,
    this.themeData,
    this.datefieldLabel = "",
    this.timefieldLabel = "",
    this.datetextStyle,
    this.timetextStyle,
    this.cancelText,
    this.confirmText,
    this.iconColor = Colors.black,
    this.selectedTextStyle,
    this.prefixTimeIcon,
    this.suffixDateIcon,
    this.suffixTimeIcon,
    this.isReadOnly = false,
    this.dateFormat = "yyyy-MM-dd"
  });

  ///HANDLES THE DATE PICKER DIALOG
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: themeData ?? ThemeData.light(),
          child: child,
        );
      },
      cancelText: cancelText ?? 'Cancel',
      confirmText: confirmText ?? 'Ok',
      initialDatePickerMode: initialEntryMode,
      initialEntryMode: DatePickerEntryMode.calendar,
    );
    if (picked != null && onDateSubmitted != null) {
      ///HERE AS IT RETURNS THE TIME ALL IN 00:00 FORMAT THEN REEMOVING THE TIME FROM PICKED DATE
      String formattedDate = DateFormat(dateFormat).format(picked);
      dynamic _picked = (formattedDate).toString().split(' ')[0];
      if (dateTextEditingController != null) {
        dateTextEditingController.text = _picked;
      }
      onDateSubmitted(_picked, GtDateTimeType.DATE, picked);
    }
  }

  ///HANDLES THE TIME PICKER DIALOG
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: themeData ?? ThemeData.light(),
          child: child,
        );
      },
      cancelText: cancelText ?? 'Cancel',
      confirmText: confirmText ?? 'Ok',
      initialTime: TimeOfDay.fromDateTime(initialDate ?? DateTime.now()),
    );

    if (picked != null && onDateSubmitted != null) {
      ///HERE GETTING THE HOUR AND MINUTES DATA FROM THE TIME OF DAY
      String _hr = '0' + '${picked.hour}',
          _min = '0' + '${picked.minute}',
          _time =
              '${_hr.substring((_hr.length - 2), _hr.length)}:${_min.substring((_min.length - 2), _min.length)}';
      if (timeTextEditingController != null) {
        timeTextEditingController.text = _time;
      }

      DateTime _picked = DateTime(initialDate.year, initialDate.month,
          initialDate.day, picked.hour, picked.minute);
      onDateSubmitted(_time, GtDateTimeType.TIME, _picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ///FORM FIELD LABEL
        if (label != null)
          GtText(text: label, textStyle: labeltextStyle ?? TextStyle()),
        Row(
          children: [
            ///DATE WIDGET FOR HANDLING DATE DIALOG
            if (type == GtDateTimeType.BOTH || type == GtDateTimeType.DATE)
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () => !isReadOnly ? _selectDate(context) : null,
                  child: AbsorbPointer(
                    child: GtTextFormField(
                      fieldLabel: datefieldLabel,
                      labeltextStyle: datetextStyle ?? TextStyle(),
                      isReadOnly: true,
                      isRequired: isRequired,
                      onSaveHandler: (val) {
                        if (onSaveHandler != null) {
                          onSaveHandler(initialDate, GtDateTimeType.DATE);
                        }
                      },
                      textEditingController: dateTextEditingController,
                      textStyle: selectedTextStyle,
                      prefixIcon: prefixDateIcon,
                      chips: suffixDateIcon,
                          
                    ),
                  ),
                ),
              ),

            ///FOR SPACE BETWEEN DATE AND TIME WIDGET
            SizedBox(width: 5),

            ///TIME WIDGET FOR HANDLING TIME DIALOG
            if (type == GtDateTimeType.BOTH || type == GtDateTimeType.TIME)
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => !isReadOnly ? _selectTime(context) : null,
                  child: AbsorbPointer(
                    child: GtTextFormField(
                      fieldLabel: timefieldLabel,
                      labeltextStyle: timetextStyle ?? TextStyle(),
                      isReadOnly: true,
                      isRequired: isRequired,
                      onSaveHandler: (val) {
                        if (onSaveHandler != null) {
                          onSaveHandler(initialDate, GtDateTimeType.TIME);
                        }
                      },
                      textStyle: selectedTextStyle,
                      textEditingController: timeTextEditingController,
                      prefixIcon: prefixTimeIcon,
                      chips: suffixTimeIcon,
                    ),
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }
}
