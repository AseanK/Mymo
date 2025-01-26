import 'package:flutter/material.dart';

class MainMoments extends StatelessWidget {
  const MainMoments({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Years"),
        Text("Months"),
        Text("Weeks"),
      ],);
  }
}