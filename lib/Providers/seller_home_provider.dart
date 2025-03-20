import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellerHomeProvider extends ChangeNotifier {
  XFile? _selectedImage;
  int _selectedIndex = 0;
  String? _selectedLocation;

  // Getters
  XFile? get selectedImage => _selectedImage;
  int get selectedIndex => _selectedIndex;
  String? get selectedLocation => _selectedLocation;

  // Methods
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _selectedImage = image;
      notifyListeners();
    }
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setSelectedLocation(String? location) {
    _selectedLocation = location;
    notifyListeners();
  }
}