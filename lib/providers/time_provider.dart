import 'dart:async';

import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  DateTime now = DateTime.now();
  late DateTime yearPosition;
  late DateTime monthPosition;
  late DateTime weekPosition;
  late DateTime dayPosition;

  void getYearPosition() {
    int remainingDays = getRemainingDaysYear();
    int totalDays = getTotalDaysYear();
    double percentage = 1 - (remainingDays / totalDays); // Passed percentage

    int seconds = (percentage * 60).floor(); // Map percentage to seconds (0-59)

    yearPosition = DateTime(now.year, now.month, now.day, 0, 0,
        seconds); // Return a DateTime with the calculated second-hand position

    notifyListeners();
  }

  int getTotalDaysYear() {
    return DateTime(now.year + 1, 1, 1)
        .difference(DateTime(now.year, 1, 1))
        .inDays;
  }

  int getRemainingDaysYear() {
    DateTime nextYear = DateTime(now.year + 1, 1, 1);
    return nextYear.difference(now).inDays;
  }

  int getCurrentDaysYear() {
    return getTotalDaysYear() - getRemainingDaysYear();
  }

  // YEAR
  // DateTime calculateYearPosition() {
  //   int remainingDays = getRemainingDaysYear();
  //   int totalDays = getTotalDaysYear();
  //   double percentage = 1 - (remainingDays / totalDays); // Passed percentage
  //
  //   int seconds = (percentage * 60).floor(); // Map percentage to seconds (0-59)
  //
  //   return DateTime(now.year, now.month, now.day, 0, 0,
  //       seconds); // Return a DateTime with the calculated second-hand position
  // }
  //
  // int getTotalDaysYear() {
  //   return DateTime(now.year + 1, 1, 1)
  //       .difference(DateTime(now.year, 1, 1))
  //       .inDays;
  // }
  //
  // int getRemainingDaysYear() {
  //   DateTime nextYear = DateTime(now.year + 1, 1, 1);
  //   return nextYear.difference(now).inDays;
  // }
  //
  // int getCurrentDaysYear() {
  //   return getTotalDaysYear() - getRemainingDaysYear();
  // }
  //
  // // MONTH
  // DateTime calculateMonthPosition() {
  //   int remainingDays = getRemainingDaysMonth();
  //   int totalDays = getTotalDaysMonth();
  //   double percentage = 1 - (remainingDays / totalDays);
  //
  //   int seconds = (percentage * 60).floor();
  //
  //   return DateTime(now.year, now.month, now.day, 0, 0, seconds);
  // }
  //
  // int getTotalDaysMonth() {
  //   return DateTime(now.year, now.month + 1, 1)
  //       .difference(DateTime(now.year, now.month, 1))
  //       .inDays;
  // }
  //
  // int getRemainingDaysMonth() {
  //   DateTime nextMonth = DateTime(now.year, now.month + 1, 1);
  //   return nextMonth.difference(now).inDays;
  // }
  //
  // int getCurrentDaysMonth() {
  //   return getTotalDaysMonth() - getRemainingDaysMonth();
  // }
  //
  // // WEEKS
  // DateTime calculateWeekPosition() {
  //   int today = now.weekday;
  //   double percentage = today / 7;
  //
  //   int seconds = (percentage * 60).floor();
  //   return DateTime(now.year, now.month, now.day, 0, 0, seconds);
  // }
  //
  // String getCurrentWeekday() {
  //   switch (now.weekday) {
  //     case 1:
  //       return "Mon";
  //     case 2:
  //       return "Tue";
  //     case 3:
  //       return "Wed";
  //     case 4:
  //       return "Thu";
  //     case 5:
  //       return "Fri";
  //     case 6:
  //       return "Sat";
  //     case 7:
  //       return "Sun";
  //     default:
  //       return "";
  //   }
  // }
  //
  // // Days
  // DateTime calculateDayPosition() {
  //   int today = now.hour;
  //   double percentage = today / 24;
  //
  //   int seconds = (percentage * 60).floor();
  //   return DateTime(now.year, now.month, now.day, 0, 0, seconds);
  // }
  //
  // String getCurrentDay() {
  //   return now.hour.toString();
  // }
  //
  // // Hours
  // DateTime calculateHourPosition() {
  //   int seconds = now.minute;
  //   return DateTime(now.year, now.month, now.day, 0, 0, seconds);
  // }
  //
  // String getCurrentHour() {
  //   return now.minute.toString();
  // }
  //
  // // Minutes
  // DateTime calculateMinutePosition() {
  //   int seconds = now.second;
  //   return DateTime(now.year, now.month, now.day, 0, 0, seconds);
  // }
  //
  // String getCurrentMinute() {
  //   return now.second.toString();
  // }
}
