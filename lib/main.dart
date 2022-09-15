
import 'package:mvc_application/controller.dart';
import 'package:mvc_application/view.dart';
import 'package:provider/provider.dart';
import 'package:untitled/controller/counter_controller.dart';
import 'package:untitled/model/counter_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CounterModel(),
    child: MaterialApp(
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget{

  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends StateMVC<MyApp>{

  CounterController? _con;

  _MyAppState() : super(CounterController()){
    _con = CounterController.getCounterController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVC Counter App'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button ', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Consumer<CounterModel>(
              builder: (context, viewModel, child){
                return Text('${viewModel.getCounter}', style: TextStyle(fontSize: 20));
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _con!.incrementCounter(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
