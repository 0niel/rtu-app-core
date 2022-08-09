import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rtu_app_core/themes/text_style.dart';
import 'package:table_calendar/table_calendar.dart';

import 'custom_builders/builder_type.dart';
import 'custom_builders/calendar_header.dart';
import 'custom_builders/cell_builder.dart';
import 'custom_builders/markers_builder.dart';

class NinjaTableCalendar extends StatefulWidget {
  const NinjaTableCalendar({
    Key? key,
    required this.firstCalendarDay,
    required this.lastCalendarDay,
    this.eventLoader,
    this.onDaySelected,
  }) : super(key: key);

  final DateTime firstCalendarDay;
  final DateTime lastCalendarDay;

  final List<Object?> Function(DateTime)? eventLoader;
  final Function(DateTime, DateTime)? onDaySelected;

  @override
  State<NinjaTableCalendar> createState() => _NinjaTableCalendarState();
}

class _NinjaTableCalendarState extends State<NinjaTableCalendar> {
  PageController? _pageController;

  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  /// Normalization of the day so that the day is not up to [widget.lastCalendarDay]
  /// and after [widget.firstCalendarDay].
  DateTime _validateDayInRange(DateTime newDate) {
    if (newDate.isAfter(widget.lastCalendarDay)) {
      return widget.lastCalendarDay;
    } else if (newDate.isBefore(widget.firstCalendarDay)) {
      return widget.firstCalendarDay;
    }
    return newDate;
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ru_RU',
      weekendDays: const [DateTime.sunday],
      startingDayOfWeek: StartingDayOfWeek.monday,
      sixWeekMonthsEnforced: false,
      onCalendarCreated: (controller) => _pageController = controller,
      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: (context, day) {
          return CalendarHeader(
            day: day,
            format: _calendarFormat,
            pageController: _pageController,
          );
        },
        defaultBuilder: (context, day, focusedDay) =>
            CellBuilder(type: BuilderType.defaultBuilder, day: day),
        todayBuilder: (context, day, focusedDay) =>
            CellBuilder(type: BuilderType.todayBuilder, day: day),
        selectedBuilder: (context, day, focusedDay) =>
            CellBuilder(type: BuilderType.selectedBuilder, day: day),
        outsideBuilder: (context, day, focusedDay) =>
            CellBuilder(type: BuilderType.outsideBuilder, day: day),
        markerBuilder: (context, day, events) => MarkersBuilder(events: events),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        dowTextFormatter: (date, locale) =>
            DateFormat.E(locale).format(date)[0].toUpperCase() +
            DateFormat.E(locale).format(date).substring(1),
        weekendStyle: NinjaTextStyle.bodyMedium(
            fontWeight: 600,
            color: const Color(0xFF8F9BB3)), // TODO: change color
        weekdayStyle: NinjaTextStyle.bodyMedium(
            fontWeight: 600, color: const Color(0xFF8F9BB3)),
      ),
      headerVisible: true,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        leftChevronVisible: false,
        rightChevronVisible: false,
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Месяц',
        CalendarFormat.week: 'Неделя'
      },
      eventLoader: (day) {
        if (widget.eventLoader != null) {
          return widget.eventLoader!(day);
        }
        return [];
      },
      selectedDayPredicate: (day) {
        // Use `selectedDayPredicate` to determine which day is currently selected.
        // If this returns true, then `day` will be marked as selected.

        // Using `isSameDay` is recommended to disregard
        // the time-part of compared DateTime objects.
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = _validateDayInRange(focusedDay);
          });
          widget.onDaySelected?.call(selectedDay, focusedDay);
        }
      },
      onPageChanged: (focusedDay) {
        // No need to call `setState()` here
        _focusedDay = _validateDayInRange(focusedDay);
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          // Call `setState()` when updating calendar format
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onHeaderTapped: (date) {},
      onHeaderLongPressed: (date) {},
      firstDay: widget.firstCalendarDay,
      lastDay: widget.lastCalendarDay,
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
    );
  }
}
