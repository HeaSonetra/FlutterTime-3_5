import 'package:bloc2/controller/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text("SecondPage",style: TextStyle(fontSize: 30),)),
      ),
      body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterCubit,int>(
                  builder:(context,count){
                    return Text("Counter:${count}",style: TextStyle(fontSize: 26),);
                  } 
                ),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: ()=>context.read<CounterCubit>().increment(), child:Text("+",style: TextStyle(fontSize: 26),)),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SecondPage()));
                }, child: Text("Go To SeacondPage"))
              ],
            ),
           ),
    );
  }
}