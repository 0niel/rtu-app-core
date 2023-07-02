
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../themes/themes.dart';
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
    this.onHeaderTapped,
    this.onHeaderLongPressed,
    this.onPageChanged,
    this.onFormatChanged,
    this.holidayPredicate,
    this.onDayLongPressed,
  }) : super(key: key);

  final DateTime firstCalendarDay;
  final DateTime lastCalendarDay;

  final Function(DateTime)? onHeaderTapped;
  final Function(DateTime)? onHeaderLongPressed;
  final Function(CalendarFormat)? onFormatChanged;

  /// Called whenever currently visible calendar page is changed.
  final Function(DateTime)? onPageChanged;

  /// Function that assigns a list of events to a specified day.
  final List<dynamic> Function(DateTime)? eventLoader;

  /// Function deciding whether given day is treated as a holiday.
  final bool Function(DateTime)? holidayPredicate;
  final Function(DateTime, DateTime)? onDaySelected;
  final void Function(DateTime, DateTime)? onDayLongPressed;

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
        widget.onPageChanged?.call(_focusedDay);
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          // Call `setState()` when updating calendar format
          setState(() {
            _calendarFormat = format;
          });
          widget.onFormatChanged?.call(format);
        }
      },
      onDayLongPressed: (selectedDay, focusedDay) =>
          widget.onDayLongPressed?.call(selectedDay, focusedDay),
      holidayPredicate: (day) => widget.holidayPredicate != null
          ? widget.holidayPredicate!(day)
          : false,
      onHeaderTapped: (date) => widget.onHeaderTapped?.call(date),
      onHeaderLongPressed: (date) => widget.onHeaderLongPressed?.call(date),
      firstDay: widget.firstCalendarDay,
      lastDay: widget.lastCalendarDay,
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
    );
  }
}
