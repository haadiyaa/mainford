import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_ford/resources/appvalidators.dart';

class FunctionsProvider extends ChangeNotifier {
  String? imageValidation;
  File? selectedImage;
  final AppValidators appValidators = AppValidators();

  void getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageValidation = null;
      selectedImage = File(image.path);
      notifyListeners();
    }
  }

  void setImage(File file) {
    imageValidation = null;
    selectedImage = File(file.path);
    notifyListeners();
  }

  void removeImage() {
    selectedImage = null;
    notifyListeners();
  }

  void validateImage(File file) {
    imageValidation = appValidators.imageValidator(value: file);
    notifyListeners();
  }
}
