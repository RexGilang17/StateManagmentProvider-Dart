import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorState with ChangeNotifier {
  bool _isOrange = false;

  bool get getisOrange {
    return _isOrange;
  }

  Color get getColor {
    return _isOrange ? Colors.deepOrange : Colors.deepPurple;
  }

  set setColor(bool value) {
    _isOrange = value;
    notifyListeners();
  }
}
