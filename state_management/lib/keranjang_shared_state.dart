import 'package:flutter/material.dart';

class KeranjangState with ChangeNotifier {
  int _qty = 0;

  int get getQty {
    return _qty;
  }

  void tambahkeranjang() {
    _qty++;
    notifyListeners();
  }
}

class KeranjangState1 with ChangeNotifier {
  int _qty1 = 1;

  int get getQty1 {
    return _qty1;
  }

  void tambahkeranjang() {
    _qty1++;
    notifyListeners();
  }
}

class KeranjangState2 with ChangeNotifier {
  int _qty2 = 1;

  int get getQty2 {
    return _qty2;
  }

  void tambahkeranjang() {
    _qty2++;
    notifyListeners();
  }
}
