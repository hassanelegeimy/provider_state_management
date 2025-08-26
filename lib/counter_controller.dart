import 'package:flutter/cupertino.dart';

class CounterController extends ChangeNotifier {
  int counter = 0;

  String? userName;
  String? age;

  void setUserName(String? userName) {
    this.userName = userName;
    notifyListeners();
  }

  void setAge(String? age) {
    this.age = age;
    notifyListeners();
  }

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    notifyListeners();
  }
}
