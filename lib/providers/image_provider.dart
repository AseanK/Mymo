import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageProvider extends ChangeNotifier {
  final  List<XFile?> _images = [];

  List<XFile?> get images => _images;

  void buildImage({required XFile? media}) {
    if (!_images.contains(media))  _images.add(media);

    notifyListeners();
  }

  void deleteImage({required XFile? media}) {
    if (_images.contains(media))  _images.remove(media);

    notifyListeners();
  }
}