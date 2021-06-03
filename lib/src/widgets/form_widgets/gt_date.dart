import 'package:flutter/material.dart';
import 'package:greytrix_ui_kit/greytrix_ui_kit.dart';
import 'package:flutter/cupertino.dart';
import 'gt_text_form_field.dart';

class GtDate extends StatelessWidget {
  final GtDateTimeType type;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final IconData prefixIcon;
  final String label;
  final bool isRequired;
  final Function(dynamic val, GtDateTimeType type, dynamic date)
      onDateSubmitted;
  final Function(dynamic val, GtDateTimeType type) onSaveHandler;
  final TextEditingController dateTextEditingController;
  final TextEditingController timeTextEditingController;
  final DatePickerMode initialEntryMode;
  final DatePickerEntryMode datePickerEntryMode;
  GtDate({
    this.type = GtDateTimeType.BOTH,
    @required this.label,
    @required this.initialDate,
    this.firstDate,
    this.lastDate,
    this.prefixIcon = Icons.calendar_today,
    this.isRequired = false,
    this.onDateSubmitted,
    this.onSaveHandler,
    this.dateTextEditingController,
    this.timeTextEditingController,
    this.datePickerEntryMode = DatePickerEntryMode.calendar,
    this.initialEntryMode = DatePickerMode.day,
  });

  ///HANDLES THE DATE PICKER DIALOG
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDatePickerMode: initialEntryMode,
      initialEntryMode: DatePickerEntryMode.calendar,
    );
    if (picked != null && onDateSubmitted != null) {
      ///HERE AS IT RETURNS THE TIME ALL IN 00:00 FORMAT THEN REEMOVING THE TIME FROM PICKED DATE
      dynamic _picked = (picked).toString().split(' ')[0];
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
          GtText(
            text: label,
          ),
        Row(
          children: [
            ///DATE WIDGET FOR HANDLING DATE DIALOG
            if (type == GtDateTimeType.BOTH || type == GtDateTimeType.DATE)
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: GtTextFormField(
                      fieldLabel: 'Date',
                      isReadOnly: true,
                      isRequired: isRequired,
                      onSaveHandler: (val) {
                        if (onSaveHandler != null) {
                          onSaveHandler(initialDate, GtDateTimeType.DATE);
                        }
                      },
                      textEditingController: dateTextEditingController,
                      prefixIcon: Icon(Icons.calendar_today_outlined),
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
                  onTap: () => _selectTime(context),
                  child: AbsorbPointer(
                    child: GtTextFormField(
                      fieldLabel: 'Time',
                      isReadOnly: true,
                      isRequired: isRequired,
                      onSaveHandler: (val) {
                        if (onSaveHandler != null) {
                          onSaveHandler(initialDate, GtDateTimeType.TIME);
                        }
                      },
                      textEditingController: timeTextEditingController,
                      prefixIcon: Icon(Icons.alarm),
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