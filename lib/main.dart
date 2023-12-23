import 'package:flutter/material.dart';

import "package:flutter_bloc/flutter_bloc.dart";

import 'cubit/counter_cubit.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "cubit and bloc trial",
      home: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: HomeScreen(),
      )

    );
  }
}

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade200,
        child: Center(child:
         BlocBuilder<CounterCubit,int>(builder: (context, state) {
           return Text("$state");
         }, )
          /*Text("${context.watch<CounterCubit>().state
        }", style: TextStyle(fontSize: 30),)*/
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(onPressed: () {

context.read<CounterCubit>().decrement();

          }, child: Icon(Icons.remove),),
          FloatingActionButton(onPressed: () {

            BlocProvider.of<CounterCubit>(context).increment();

          }
              , child: Icon(Icons.add)),
        ],
      ),

    );
  }
}
