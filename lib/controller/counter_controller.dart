import 'package:mvc_application/controller.dart';
import 'package:provider/provider.dart';

import '../model/counter_model.dart';

class CounterController extends ControllerMVC{
  static CounterController? _this;
  static CounterModel? model;

  factory CounterController() => _this ??= CounterController._private();

  CounterController._private(){
    model = CounterModel();
  }

  static CounterController? get getCounterController => _this;

  int get getCounter => model!.getCounter;

  void incrementCounter(BuildContext context) => Provider.of<CounterModel>(context, listen: false).incrementCounter();

}