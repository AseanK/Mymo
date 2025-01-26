import 'package:flutter/material.dart';
import 'package:mymo/components/moment/moment_input.dart';

class Moment extends StatefulWidget {
  const Moment({super.key});

  @override
  State<Moment> createState() => _MomentState();
}

class _MomentState extends State<Moment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MomentInput(),
      ),
    );
  }
}