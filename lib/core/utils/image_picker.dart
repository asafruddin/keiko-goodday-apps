import 'dart:io';

import 'package:image_picker/image_picker.dart';

class TakePicture {
  final _picker = ImagePicker();

  Future<File> getPicture() async {
    return _picker.pickImage(source: ImageSource.camera).then((value) {
      if (value != null) {
        return File(value.path);
      } else {
        return File('');
      }
    });
  }
}
