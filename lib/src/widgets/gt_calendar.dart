import 'package:flutter/material.dart';
import '../models/index.dart';
import 'package:table_calendar/table_calendar.dart';

class GtCalendar extends StatelessWidget {
  GtCalendar(
      {@required this.focusedDay,
      @required this.firstDate,
      @required this.lastDate,
      @required this.selectedDay,
      this.rangeEndDay,
      this.rangeStartDay,
      this.calendarFormat,
      this.rangeSelectionMode,
      this.eventLoader,
      this.calendarStyle,
      this.calendarBuilders,
      this.onDaySelected,
      this.onRangeSelected,
      this.onFormatChanged,
      this.onPageChanged,
      this.eventViewer});

  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime focusedDay;
  final DateTime selectedDay;
  final DateTime rangeStartDay;
  final DateTime rangeEndDay;
  final CalendarFormat calendarFormat;
  final RangeSelectionMode rangeSelectionMode;
  final List<CalendarEvent> Function(DateTime) eventLoader;
  final CalendarStyle calendarStyle;
  final CalendarBuilders calendarBuilders;
  final Function(DateTime, DateTime) onDaySelected;
  final Function(DateTime, DateTime, DateTime) onRangeSelected;
  final Function(CalendarFormat) onFormatChanged;
  final Function(DateTime) onPageChanged;
  final Widget eventViewer;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TableCalendar<CalendarEvent>(
        firstDay: firstDate ?? DateTime(1900).toUtc(),
        lastDay: lastDate ?? DateTime(2100).toUtc(),
        focusedDay: focusedDay ?? DateTime.now().toUtc(),
        selectedDayPredicate: (day) => isSameDay(selectedDay.toUtc(), day),
        rangeStartDay: rangeStartDay ?? DateTime.now().toUtc(),
        rangeEndDay: rangeEndDay ?? DateTime.now().toUtc(),
        calendarFormat: calendarFormat ?? CalendarFormat.month,
        rangeSelectionMode: rangeSelectionMode ?? RangeSelectionMode.toggledOff,
        eventLoader: (date) {
          if (eventLoader(date) != null) eventLoader(date);
        },
        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarStyle: CalendarStyle(
          // Use `CalendarStyle` to customize the UI
          outsideDaysVisible: false,
          isTodayHighlighted: true,
          selectedDecoration: const BoxDecoration(
            color: const Color(0xFF5C6BC0),
            shape: BoxShape.circle,
          ),
        ),
        calendarBuilders: calendarBuilders ?? CalendarBuilders(),
        onDaySelected: (selectedday, focusedday) {
          if (onDaySelected(selectedday, focusedday) != null)
            onDaySelected(selectedday, focusedday);
        },
        onRangeSelected: onRangeSelected,
        onFormatChanged: (format) {
          if (onFormatChanged(format) != null) onFormatChanged(format);
        },
        onPageChanged: (focusedDay) {
          if (onPageChanged(focusedDay) != null) onPageChanged(focusedDay);
        },
      ),
      if (eventViewer != null) eventViewer
    ]);
  }
}
