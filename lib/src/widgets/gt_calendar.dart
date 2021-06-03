import 'package:flutter/material.dart';

class GtCalendar extends StatelessWidget {
  GtCalendar({
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateChanged,
  });

  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function(DateTime dateTime) onDateChanged;
  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
        initialDate: initialDate ?? DateTime.now(),
        firstDate: firstDate ?? DateTime(1900),
        lastDate: lastDate ?? DateTime(2100),
        onDateChanged: (date) {if (onDateChanged != null) onDateChanged(date);});
  }
}
