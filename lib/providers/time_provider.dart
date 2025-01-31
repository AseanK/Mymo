import 'dart:async';
import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  int currentMilliseconds = DateTime.now().millisecond;
  int currentSecond = DateTime.now().second;
  int currentMinute = DateTime.now().minute;
  int currentHour = DateTime.now().hour;
  int currentDay = DateTime.now().day;
  int currentWeek = DateTime.now().weekday;
  int currentMonth = DateTime.now().month;
  int currentYear = DateTime.now().year;

  late int daysInMonth;

  late double yearPosition;
  late double monthPosition;
  late double weekPosition;
  late double dayPosition;
  late double hourPosition;
  late double minutePosition;
  Timer? timer;

  TimeProvider() {
    daysInMonth = getDaysInMonth(currentMonth, currentYear);
    updateMinutePosition();
    updateHourPosition();
    updateDayPosition();
    updateWeekPosition();
    updateMonthPosition();
    updateYearPosition();

    timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      currentMilliseconds++;
      updateMinutePosition();
      if (currentMilliseconds == 1000) {
        currentMilliseconds = 0;
        currentSecond++;
        updateHourPosition();
      }

      if (currentSecond == 60) {
        currentSecond = 0;
        currentMinute++;
        updateDayPosition();
      }

      if (currentMinute == 60) {
        currentMinute = 0;
        currentHour++;
        updateWeekPosition();
      }

      if (currentHour == 24) {
        currentHour = 0;
        currentDay++;
        currentWeek++;
        updateMonthPosition();
        updateYearPosition();
      }

      if (currentWeek > 7) {
        currentWeek = 1;
      }

      if (currentDay > daysInMonth) {
        currentDay = 1;
        currentMonth++;
      }

      if (currentMonth > 12) {
        currentMonth = 1;
        currentYear++;
      }
    });
  }

  // YEAR
  int getTotalDaysYear() {
    return DateTime(currentYear + 1, 1, 1)
        .difference(DateTime(currentYear, 1, 1))
        .inDays;
  }

  int getRemainingDaysYear() {
    DateTime nextYear = DateTime(currentYear + 1, 1, 1);
    return nextYear
        .difference(DateTime(currentYear, currentMonth, currentDay))
        .inDays;
  }

  int getCurrentDaysYear() {
    return getTotalDaysYear() - getRemainingDaysYear();
  }

  void updateYearPosition() {
    int days = getCurrentDaysYear();
    int totalDays = getTotalDaysYear();
    yearPosition = days / totalDays;

    notifyListeners();
  }

  // MONTH
  int getDaysInMonth(int month, int year) {
    return DateTime(year, month + 1, 0).day;
  }

  void updateMonthPosition() {
    double month = currentDay / getDaysInMonth(currentMonth, currentYear);
    double hour = currentHour / 24;
    monthPosition = month + hour;

    notifyListeners();
  }

  void updateWeekPosition() {
    double week = currentWeek / 7;
    double day = currentHour / 168;
    weekPosition = week + day;

    notifyListeners();
  }

  void updateDayPosition() {
    double hour = currentHour / 24;
    double min = currentMinute / 1440;

    dayPosition = hour + min;

    notifyListeners();
  }

  void updateHourPosition() {
    double min = currentMinute / 60;
    double sec = currentSecond / 3600;
    hourPosition = min + sec;

    notifyListeners();
  }

  void updateMinutePosition() {
    double sec = currentSecond / 60;
    double mil = currentMilliseconds / 60000;
    minutePosition = sec + mil;

    notifyListeners();
  }
}
