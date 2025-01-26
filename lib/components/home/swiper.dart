import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:mymo/components/title_label.dart';
import 'package:mymo/providers/time_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainSwiper extends StatefulWidget {
  const MainSwiper({super.key});

  @override
  State<MainSwiper> createState() => _MainSwiperState();
}

class _MainSwiperState extends State<MainSwiper> with TimeProvider {
  @override
  Widget build(BuildContext context) {
    List<List<Function>> clockList = [[calculateYearPosition, getTotalDaysYear, getCurrentDaysYear], [calculateMonthPosition, getTotalDaysMonth, getCurrentDaysMonth], [calculateWeekPosition, getCurrentWeekday], [calculateDayPosition, getCurrentDay], [calculateHourPosition, getCurrentHour], [calculateMinutePosition, getCurrentMinute]];
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
              options: CarouselOptions(
                viewportFraction: 1.0,
                height: 300
                ),
              items: clockList.map((item) => Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/3.png"),
                  fit: BoxFit.contain,
                  ),
                ),
                child: AnalogClock(
                    dateTime: item[0].call(),
                    isKeepTime: false,
                    dialColor: null,
                    dialBorderWidthFactor: 0,
                    markingColor: null,
                    hourHandLengthFactor: 0,
                    minuteHandLengthFactor: 0,
                    secondHandColor: Colors.black,
                    secondHandLengthFactor: 0.6,
                    hourNumbers: [
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      "",
                      item.length == 3 ? item[2].call().toString() : item[1].call(),
                    ],
                    hourNumberSizeFactor: 1,
                    hourNumberRadiusFactor: .6,
                    centerPointWidthFactor: .5,
                    child: Text("Year"),
                  ),
              ),).toList(),
            );
            },
          ),
        ],
      ),
    );
  }
}
