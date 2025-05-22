import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:getx_demo/controller/MovieController.dart';

class Favoritepage extends StatelessWidget {
  final Moviecontroller moviecontroller = Get.find<Moviecontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite")),
      body: Obx(() {
        return moviecontroller.fovriteMovie.isEmpty
            ? Text("No favorite yet")
            : ListView.builder(
              itemCount: moviecontroller.fovriteMovie.length,
              itemBuilder: (context, index) {
                final movie = moviecontroller.movies[index];
                return ListTile(
                  title: Text(movie.title),
                );
              },
            );
      }),
    );
  }
}
