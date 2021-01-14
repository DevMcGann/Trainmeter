import 'package:flutter/material.dart';

class timeProvider with ChangeNotifier{
  static const routeName = '/timer-screen';

  Duration _preparing;
  Duration _working;
  Duration _resting;
  int _sets = 1;

  void setPreparing(Duration duration){
    _preparing = duration;
    notifyListeners();
  }

  void setWorking (Duration duration){
    _working = duration;
    notifyListeners();
  }

  void setResting (Duration duration) {
    _resting = duration;
    notifyListeners();
  }

  void addSets () {
    _sets ++;
    notifyListeners();
  }

  void quitSets(){
    if (_sets > 0){
      _sets --;
      notifyListeners();
    }
  }

 Duration get getPreparing => _preparing;
 Duration get getWorking => _working;
 Duration get getResting => _resting;
 int get getSets => _sets;


}