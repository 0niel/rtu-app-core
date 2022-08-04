import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:rtu_app_core/themes/text_style.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../themes/app_theme.dart';
import '../../themes/constant.dart';
import '../button/button.dart';
import '../text/text.dart';

class NinjaTableCalendar extends StatefulWidget {
  NinjaTableCalendar(
      {Key? key, required this.firstCalendarDay, required this.lastCalendarDay})
      : super(key: key);

  final DateTime firstCalendarDay;
  final DateTime lastCalendarDay;

  final SvgPicture headerLeftIcon = SvgPicture.string(
      """<svg width="6" height="10" viewBox="0 0 6 10" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M1 5L5 9" stroke="#232323" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M1 5L5 1" stroke="#232323" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
""");

  final headerRightIcon = SvgPicture.string(
      """<svg width="6" height="10" viewBox="0 0 6 10" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M5 5L1 9" stroke="#232323" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M5 5L1 1" stroke="#232323" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
""");

  @override
  State<NinjaTableCalendar> createState() => _NinjaTableCalendarState();
}

class _NinjaTableCalendarState extends State<NinjaTableCalendar> {
  late final PageController _pageController;

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
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NinjaButton.rounded(
                    backgroundColor: Colors.transparent,
                    child: widget.headerLeftIcon,
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NinjaText.bodyMedium(
                        DateFormat.yMMMM('ru_RU').format(day)[0].toUpperCase() +
                            DateFormat.yMMMM('ru_RU')
                                .format(day)
                                .substring(1)
                                .replaceAll(RegExp(r' г.'), ' '),
                        color: AppTheme.theme.colorScheme.onBackground,
                        fontWeight: 600,
                      ),
                      const SizedBox(width: 5.50),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff232323),
                        ),
                      ),
                      const SizedBox(width: 5.50),
                      NinjaText.bodyMedium(
                        "12 неделя",
                        color: AppTheme.theme.colorScheme.onBackground,
                        fontWeight: 600,
                      ),
                    ],
                  ),
                  NinjaButton.rounded(
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: widget.headerRightIcon,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(
                color: NinjaConstant.grey200,
                height: 1,
                indent: 24,
                endIndent: 24,
              ),
              const SizedBox(height: 20),
            ],
          );
        },
        defaultBuilder: (context, day, focusedDay) {
          return Container(
            width: 30,
            height: 40,
            alignment: Alignment.topCenter,
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: NinjaConstant.grey100,
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.all(5),
              child: Text(
                day.day.toString(),
                style: NinjaTextStyle.bodyMedium(
                    fontWeight: 600,
                    color: (day.weekday == 6 || day.weekday == 7)
                        ? const Color(0xFF8F9BB3)
                        : NinjaConstant.primaryBlack),
              ),
            ),
          );
        },
        todayBuilder: (context, day, focusedDay) {
          return Container(
            width: 30,
            height: 40,
            alignment: Alignment.topCenter,
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: NinjaConstant.error,
                  width: 1,
                ),
              ),
              child: Text(
                day.day.toString(),
                style: NinjaTextStyle.bodyMedium(
                  fontWeight: 600,
                  color: NinjaConstant.error,
                ),
              ),
            ),
          );
        },
        selectedBuilder: (context, day, focusedDay) {
          return Container(
            width: 30,
            height: 40,
            alignment: Alignment.topCenter,
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: NinjaConstant.primary,
              ),
              child: Text(
                day.day.toString(),
                style: NinjaTextStyle.bodyMedium(
                  fontWeight: 600,
                  color: NinjaConstant.primaryBlack,
                ),
              ),
            ),
          );
        },
        outsideBuilder: (context, day, focusedDay) {
          return Container(
            width: 30,
            height: 40,
            alignment: Alignment.topCenter,
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: NinjaConstant.grey100,
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.all(5),
              child: Text(
                day.day.toString(),
                style: NinjaTextStyle.bodyMedium(
                  fontWeight: 600,
                  color: const Color(0xFF8F9BB3)
                      .withOpacity(0.4), // TODO: change this
                ),
              ),
            ),
          );
        },
        markerBuilder: (context, day, events) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < events.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme
                            .theme.colorScheme.secondary, // TODO: change this
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
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
      calendarStyle: CalendarStyle(
        markerMargin: const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
        selectedDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: NinjaConstant.primary,
        ),
        isTodayHighlighted: true,
      ),
      headerVisible: true,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        leftChevronVisible: false,
        rightChevronVisible: false,
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Месяц',
        CalendarFormat.twoWeeks: '2 недели',
        CalendarFormat.week: 'Неделя'
      },
      eventLoader: (day) {
        return List.generate(
          Random().nextInt(5) + 1,
          (index) => 'Event ${index + 1}',
        );
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
