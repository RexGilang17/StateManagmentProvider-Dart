import 'package:flutter/material.dart';

class SaldoState with ChangeNotifier {
  int _saldo = 8000;

  int get getSaldo {
    return _saldo;
  }

  void kurangiSaldo(int cost) {
    _saldo += cost;
    notifyListeners();
  }
}

class SaldoState1 with ChangeNotifier {
  int _saldo1 = 8000;

  int get getSaldo1 {
    return _saldo1;
  }

  void kurangiSaldo(int cost) {
    _saldo1 += cost;
    notifyListeners();
  }
}

class SaldoState2 with ChangeNotifier {
  int _saldo2 = 8000;

  int get getSaldo2 {
    return _saldo2;
  }

  void kurangiSaldo(int cost) {
    _saldo2 += cost;
    notifyListeners();
  }
}

// class SaldoState2 with ChangeNotifier {
//   int _saldo = 8000;

//   int get getSaldo {
//     return _saldo;
//   }

//   void kurangiSaldo(int cost) {
//     _saldo *= cost;
//     notifyListeners();
//   }
// }
