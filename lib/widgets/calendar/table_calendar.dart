import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rtu_app_core/themes/text_style.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../themes/app_theme.dart';
import '../../themes/constant.dart';

class NinjaTableCalendar extends StatelessWidget {
  const NinjaTableCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ru_RU',
      weekendDays: const [DateTime.sunday],
      startingDayOfWeek: StartingDayOfWeek.monday,
      sixWeekMonthsEnforced: false,
      calendarBuilders: CalendarBuilders(
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
      onDaySelected: (selectedDay, focusedDay) {},
      onFormatChanged: (format) {},
      onPageChanged: (focusedDay) {},
      onHeaderTapped: (date) {},
      onHeaderLongPressed: (date) {},
      firstDay: DateTime(2020, 1, 1),
      focusedDay: DateTime.now(),
      lastDay: DateTime(2024, 1, 1),
    );
  }
}
