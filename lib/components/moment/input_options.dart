import 'package:flutter/material.dart' hide ImageProvider;
import 'package:image_picker/image_picker.dart';
import 'package:mymo/providers/image_provider.dart';
import 'package:provider/provider.dart';

class InputOptions extends StatelessWidget {
  const InputOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final imageProvider = context.read<CustomImageProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: (){
            _pickMedia(imageProvider);
          },
          icon: Icon(Icons.photo_album_outlined),
          ),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.emoji_emotions_outlined),
          ),
        IconButton(
          onPressed: (){
            _captureImage(imageProvider);
          },
          icon: Icon(Icons.camera_alt_outlined),
          ),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.add),
          ),
    ],); 
  } // vakulenkokolya

  Future _pickMedia(CustomImageProvider imageProvider) async {
    final List<XFile> returnedMedia = await ImagePicker().pickMultipleMedia();
    for (XFile m in returnedMedia) {
      imageProvider.buildImage(media: m);
    }
  }

  Future _captureImage(CustomImageProvider imageProvider) async {
    final capturedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    imageProvider.buildImage(media: capturedImage);
  }

}