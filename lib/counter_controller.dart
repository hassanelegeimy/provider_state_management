import 'package:flutter/cupertino.dart';

class CounterController extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}
