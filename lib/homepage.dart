import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  Future<dynamic>?  _getData() async {
      var url=Uri.parse("https://fakestoreapi.com/products");
      final respone=await http.get(url);
      final data =jsonDecode(respone.body);

      return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("API")),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
            }
            if(!snapshot.hasData){
                 return Center(
                  child: Text("No data"),
                );
            }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context,index){
                  return Container(
                         child: Image(image: NetworkImage("${snapshot.data![index]["image"]}")),
                  );
            });
        }),
    );
  }
}