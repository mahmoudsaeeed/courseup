import 'package:flutter/material.dart';

/// this class is responsible at store local , provide image url 
class MyCourseImgProvider extends ChangeNotifier {
  String _imageUrl = '';

/// this method has two functions:
/// the first | store the image URL temp,
/// the second | rebuild the image part in UI
  void saveImageUrl({required String path}) {
    _imageUrl = path;
    notifyListeners();
  }
/// return the stored Image url
  String getImgUrl() {
    return _imageUrl;
  }
}
