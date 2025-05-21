import 'package:bloc3/controller/counter_bloc.dart';
import 'package:bloc3/controller/counter_event.dart';
import 'package:bloc3/view/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),

        ),
        body: Center(
          child: Column(
            children: [
              BlocBuilder<CounterBloc,int>(
                builder: (context,count){
                  return Text("Counter:${count}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold
                  ),);
                }
              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(CounterIncrement());
              }, child: Icon(Icons.add)),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(CounterDecrement());
              }, child: Icon(Icons.remove)),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>SecondPage()));
              }, child: Text("Second Page",style: TextStyle(fontSize: 24),))
            ],
          ),
        ),
    );
  }
}