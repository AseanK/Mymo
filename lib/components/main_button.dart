import 'package:flutter/material.dart';
import 'package:mymo/pages/moment.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Moment()));
      },
      child: Text("Save This Moment"),
    );
  }
}

