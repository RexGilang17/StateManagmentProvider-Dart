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

class ColorState1 with ChangeNotifier {
  bool _isBlue = false;

  bool get getisBlue {
    return _isBlue;
  }

  Color get getColorScnd {
    return _isBlue ? Colors.blueAccent : Colors.greenAccent;
  }

  set setColorScnd(bool value) {
    _isBlue = value;
    notifyListeners();
  }
}

class ColorState2 with ChangeNotifier {
  bool _isAmber = false;

  bool get getisAmber {
    return _isAmber;
  }

  Color get getColorThrd {
    return _isAmber ? Colors.amber : Colors.red;
  }

  set setColorThrd(bool value) {
    _isAmber = value;
    notifyListeners();
  }
}
