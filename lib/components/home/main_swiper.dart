import 'package:flutter/material.dart';
import 'package:mymo/components/home/analog_progress_indicator.dart';
import 'package:mymo/providers/time_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class MainSwiper extends StatelessWidget {
  const MainSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final timeProvider = context.watch<TimeProvider>();
    List<double> clockList = [
      timeProvider.yearPosition,
      timeProvider.monthPosition,
      timeProvider.weekPosition,
      timeProvider.dayPosition,
      timeProvider.hourPosition,
      timeProvider.minutePosition,
    ];

    List<String> clockTypes = [
      'Year',
      'Month',
      'Week',
      'Day',
      'Hour',
      'Minute'
    ];

    return SizedBox(
      height: 400,
      child: Builder(
        builder: (context) {
          return CarouselSlider(
            options: CarouselOptions(viewportFraction: 1.0, height: 300),
            items: clockList
                .asMap()
                .entries
                .map(
                  (entry) => AnalogProgressIndicator(
                      progress: entry.value,
                      label: clockTypes[entry.key],
                      value: "${(entry.value * 100).toInt()}%"),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
