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
  int _qty1 = 20;

  int get getQty1 {
    return _qty1;
  }

  void tambahkeranjang() {
    _qty1++;
    notifyListeners();
  }
}
