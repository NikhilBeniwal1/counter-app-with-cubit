import 'package:expense_new_ui/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
ChangeNotifierProvider(
  create: (context) => CounterProvider(),
child: MyApp(),
));
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "cubit and bloc trial",
      home: HomeScreen() ,
    );
  }
}

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade200,
        child: Center(
            child: Text("${
                Provider.of<CounterProvider>(context).countvalue()
                //context.watch<CounterProvider>().state
            } ")
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(onPressed: () {
            context.read<CounterProvider>().decrementcounter();

// Provider.of<CounterProvider>(context).decrementcounter();  not working
/*context.read<CounterCubit>().decrement();*/

          }, child: Icon(Icons.remove),),
          FloatingActionButton(onPressed: () {
context.read<CounterProvider>().incrementcounter();
           /* BlocProvider.of<CounterCubit>(context).increment();*/

          }
              , child: Icon(Icons.add)),
        ],
      ),

    );
  }
}
