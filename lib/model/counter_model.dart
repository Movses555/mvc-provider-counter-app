
import 'package:mvc_application/controller.dart';

class CounterModel extends ChangeNotifier{
  static CounterModel? _this;

  factory CounterModel() => _this ??= CounterModel._();

  CounterModel._(){
    counter = 0;
  }

  int counter = 0;

  int get getCounter => counter;

  void incrementCounter(){
    ++counter;

    notifyListeners();
  }
}