import 'package:flutter/material.dart';

class Home_1Provider extends ChangeNotifier {
  String textOne = 'First Button';
  String textTwo = 'Second Button';

  int countOne = 0;
  int countTwo = 0;

  void tapOne() {
    countOne++;
    notifyListeners();
  }

  void tapTwo() {
    countTwo++;
    notifyListeners();
  }
}
