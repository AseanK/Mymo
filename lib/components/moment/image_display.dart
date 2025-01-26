import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mymo/providers/image_provider.dart';
import 'package:provider/provider.dart';

class ImageDisplay extends StatelessWidget{
  const ImageDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final imageProvider = context.watch<CustomImageProvider>();
    if (imageProvider.images.isNotEmpty) {
      return Container(
        height: 100,
        width: width,
        child: _imageList(imageProvider.images));
    }
    return Text("No image");
  }

  Widget _imageList(List<XFile?> images) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: _getImage(images),
    );
  }

  List<Widget> _getImage(List<XFile?> images) {
    final List<Widget> imageWidget = [];
    for (XFile? image in images) {
      imageWidget.add(imageContainer(image));
    }
    return imageWidget;
  }

  Widget imageContainer(XFile? image) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all()
      ),
      child: Image.file(File(image!.path), fit: BoxFit.contain,),
    );
  }
}