import 'package:flutter/material.dart';
import 'package:mymo/components/home/analog_progress_indicator.dart';
import 'package:mymo/components/title_label.dart';
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

    return SizedBox(
      height: 400,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TitleLabel(label: "Mymo"),
          Builder(
            builder: (context) {
              return CarouselSlider(
                options: CarouselOptions(viewportFraction: 1.0, height: 300),
                items: clockList
                    .map(
                      (item) => Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/3.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                          child: AnalogProgressIndicator(progress: item)),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
