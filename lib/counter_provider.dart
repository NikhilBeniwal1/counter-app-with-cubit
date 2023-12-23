
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  //state
int _counter = 5;

int countvalue(){
 return _counter;
}


//events
void incrementcounter(){
  if(_counter<10) {
      _counter++;
      notifyListeners();}
}

void decrementcounter(){
  if(_counter>0){
      _counter--;
    }
  notifyListeners();
  }

}