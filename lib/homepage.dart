import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:second_api/model/resmodelservice.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  Future<List<Resmodelservice>> _getData() async {
    try {
      var url = Uri.parse("https://fakestoreapi.com/products");
      final respone = await http.get(url);
      final data = jsonDecode(respone.body);

      return data.map<Resmodelservice>((e) => Resmodelservice.fromJson(e)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("API")),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder<List<Resmodelservice>>(
        future: _getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(child: Text("No data"));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var product = snapshot.data![index];
              return Container(
                child: Image(image: NetworkImage("${product.image}")),
              );
            },
          );
        },
      ),
    );
  }
}
