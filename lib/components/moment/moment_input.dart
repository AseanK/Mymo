import 'package:flutter/material.dart';
import 'package:mymo/components/moment/image_display.dart';
import 'package:mymo/components/moment/input_options.dart';

class MomentInput extends StatelessWidget{
  const MomentInput({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget> [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
          ImageDisplay(),
          Divider(),
          Expanded (
            child: TextField(
              textAlignVertical: TextAlignVertical.top,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              expands: true,
            ),
          ),
          Divider(),
          InputOptions(),
        ],
      ),
    );
  }
}