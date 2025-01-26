import 'package:flutter/material.dart';

class TitleLabel extends StatelessWidget{
  final String label;
  const TitleLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label);
  }
}