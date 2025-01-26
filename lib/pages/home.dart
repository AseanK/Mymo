import 'package:flutter/material.dart';
import 'package:mymo/components/main_button.dart';
import 'package:mymo/components/home/main_moments.dart';
import 'package:mymo/components/home/swiper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MainSwiper(),
            MainMoments(),
            MainButton(),
          ],
        ),
      ),
    );
  }
}
