import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_demo/controller/MovieController.dart';
import 'package:getx_demo/view/favoritePage.dart';

class Homepage extends StatelessWidget {
  final Moviecontroller moviecontroller = Get.put(Moviecontroller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double widthSize = size.width;
    double heightSize = size.height;
    return Scaffold(
      appBar: AppBar(title: Text("HomePage"),
      actions: [
        IconButton(onPressed: (){
           Get.to(Favoritepage());
        }, icon: Icon(Icons.favorite,color: Colors.red,))
      ],),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: moviecontroller.movies.length,
            itemBuilder: (context, index) {
              final movie=moviecontroller.movies[index];
              return Stack(
                children: [
                  Container(
                    height: heightSize * 0.3,
                    margin: EdgeInsets.symmetric(vertical: heightSize * 0.01),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      height:heightSize* 0.24,
                      decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    )
                  ),
                  Positioned(
                    bottom: 28,
                    child: Row(
                    
                    children: [
                      SizedBox(width: widthSize*0.02,),
                      Text(movie.title,style: TextStyle(fontSize: 24),),
                      SizedBox(width: widthSize*0.02,),
                     IconButton(
                      onPressed: ()=>moviecontroller.toggleFavorite(movie), icon: (movie.isfavorite)?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border),)
                       
                    ],
                  ))
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
