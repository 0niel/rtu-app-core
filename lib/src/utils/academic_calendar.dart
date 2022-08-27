import 'package:intl/intl.dart';

class NinjaAcademicCalendar {
  // Constructor
  NinjaAcademicCalendar({
    required this.maxSemesterWeeks,
    required this.firstSemesterStart,
    required this.secondSemesterStart,
  })  : assert(maxSemesterWeeks > 0),
        assert(firstSemesterStart.isBefore(secondSemesterStart)) {
    _semesterStartController =
        _SemesterStartController(firstSemesterStart, secondSemesterStart);
  }

  /// Maximum number of academic weeks per semester
  final int maxSemesterWeeks;

  final DateTime firstSemesterStart;
  final DateTime secondSemesterStart;

  late final _SemesterStartController _semesterStartController;

  /// Returns the current day of the week, where 1 is Mon, 7 is Sun
  int getCurrentDayOfWeek() {
    return DateTime.now().weekday;
  }

  /// Returns the number of the current week using the current date
  int getAcademicWeek({DateTime? date}) {
    DateTime currentDate = date ?? DateTime.now();
    DateTime startDate = getSemesterStart(date: currentDate);

    // If the semester has not begun, return the beginning
    if (currentDate.isBefore(startDate)) {
      return 1;
    }

    int week = _weekNumber(currentDate) - _weekNumber(startDate);

    if (currentDate.weekday != 0) {
      week++;
    }

    return week;
  }

  /// Returns the list of dates by [week] number
  List<DateTime> getDaysInWeek(int week, [DateTime? date]) {
    List<DateTime> daysInWeek = [];

    DateTime semStart = getSemesterStart(date: date);

    var firstDayOfWeek =
        semStart.subtract(Duration(days: semStart.weekday - 1));

    var firstDayOfChosenWeek =
        firstDayOfWeek.add(Duration(days: (week - 1) * 7));

    for (int i = 0; i < 7; ++i) {
      daysInWeek.add(firstDayOfChosenWeek);
      firstDayOfChosenWeek = firstDayOfChosenWeek.add(const Duration(days: 1));
    }
    return daysInWeek;
  }

  /// Get the start date of the semester
  ///
  /// [date] is the date for which
  /// the beginning of the semester will be calculated.
  DateTime getSemesterStart({DateTime? date}) {
    return _semesterStartController.getCurrentSemesterStart(date: date);
  }

  /// Get the last date of the semester
  DateTime getSemesterLastDay({DateTime? date}) {
    return getDaysInWeek(
        maxSemesterWeeks,
        _semesterStartController.getCurrentSemesterStart(
          date: date,
        )).last;
  }

  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  int _numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  int _weekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = _numOfWeeks(date.year - 1);
    } else if (woy > _numOfWeeks(date.year)) {
      woy = 1;
    }
    return woy;
  }
}

/// Get the date when the semester begins
class _SemesterStartController {
  _SemesterStartController(this.firstSemesterStart, this.secondSemesterStart);

  final DateTime firstSemesterStart;
  final DateTime secondSemesterStart;

  /// Get the first Monday of the month from which the current semester begins
  DateTime _getFirstMondayOfMonth(int year, int month) {
    var firstOfMonth = DateTime(year, month, 1);
    var firstMonday = firstOfMonth.add(
        Duration(days: (7 - (firstOfMonth.weekday - DateTime.monday)) % 7));
    return firstMonday;
  }

  /// Adjust the start date of the semester
  /// If the selected day is a day off, take the first Monday of the month,
  /// Otherwise the selected day is chosen correctly already
  DateTime _getCorrectedDate(DateTime date) {
    if (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
      return _getFirstMondayOfMonth(date.year, date.month);
    } else {
      return date;
    }
  }

  /// Get the expected start date of the semester.
  /// For the first semester it is September 1
  /// For the second semester it is February 9th
  DateTime _getExpectedSemesterStart(DateTime currentDate) {
    if (currentDate.month >= DateTime.september) {
      return firstSemesterStart;
    } else {
      return secondSemesterStart;
    }
  }

  /// Get the start date of the current semester
  DateTime getCurrentSemesterStart({
    DateTime? date,
  }) {
    DateTime currentDate = date ?? DateTime.now();
    // Expected start date of the semester
    DateTime expectedStart = _getExpectedSemesterStart(currentDate);
    // Adjust in case it falls on a day off
    return _getCorrectedDate(expectedStart);
  }
}

final defaultAcademicCalendar = NinjaAcademicCalendar(
  maxSemesterWeeks: 17,
  firstSemesterStart: DateTime(DateTime.now().year, DateTime.september, 1),
  secondSemesterStart: DateTime(DateTime.now().year + 1, DateTime.february, 8),
);
