

import 'package:get/get.dart';
import 'package:getx_demo/model/MovieModel.dart';

class Moviecontroller extends GetxController{
  var movies=<Moviemodel>[
      Moviemodel(id: 1, title: "ម៉ែក្រឡាភ្លើង", img: ""),
      Moviemodel(id: 2, title: "សុីបាយបោកឆ្នាំង", img: ""),
      Moviemodel(id: 3, title: "ធ្វើអីធ្វើទៅ", img: ""),
      Moviemodel(id: 4, title: "ស្រលាញ់ស្ទើរលេប", img: ""),
  ].obs;

  List<Moviemodel> get fovriteMovie=>movies.where((movie)=>movie.isfavorite).toList();
  
  void toggleFavorite(Moviemodel moviemodel){
       moviemodel.isfavorite=!moviemodel.isfavorite;
       movies.refresh();
  }
}