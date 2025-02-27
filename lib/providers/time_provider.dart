import 'dart:async';
import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  late DateTime now;
  late double yearPosition;
  late double monthPosition;
  late double weekPosition;
  late double dayPosition;
  late double hourPosition;
  late double minutePosition;

  TimeProvider() {
    _updateTime();
    Timer.periodic(const Duration(milliseconds: 16), (timer) => _updateTime());
  }

  void _updateTime() {
    now = DateTime.now();

    int daysInYear = DateTime(now.year + 1, 1, 1)
        .difference(DateTime(now.year, 1, 1))
        .inDays;
    int passedDaysYear = now.difference(DateTime(now.year, 1, 1)).inDays;
    yearPosition =
        (passedDaysYear / daysInYear) + (now.hour / (daysInYear * 24));

    // Month Position
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    monthPosition =
        (now.day - 1) / daysInMonth + now.hour / (daysInMonth * 24.0);

    // Week Position (1 week = 7 days)
    weekPosition = ((now.weekday - 1) / 7) + (now.hour / 168);

    // Day Position (1 day = 24 hours)
    dayPosition = (now.hour / 24) + (now.minute / 1440);

    // Hour Position (1 hour = 60 minutes)
    hourPosition = (now.minute / 60) + (now.second / 3600);

    // Minute Position (1 minute = 60 seconds)
    minutePosition = (now.second / 60) + (now.millisecond / 60000);

    notifyListeners();
  }
}
