import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier { 
  int _counter = 0;
  int get counter => _counter;
  void add(){
    _counter++;
    notifyListeners();
  }

  void reset() { 
    _counter = 0;
    notifyListeners();
  }
  
}