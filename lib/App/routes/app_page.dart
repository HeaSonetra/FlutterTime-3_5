
import 'package:fashion_state/App/module/home/views/favorite_view.dart';
import 'package:fashion_state/App/module/home/views/get_start_view.dart';
import 'package:fashion_state/App/module/home/views/history_view.dart';
import 'package:fashion_state/App/module/home/views/home_view.dart';
import 'package:fashion_state/App/module/home/views/main_view.dart';
import 'package:fashion_state/App/module/home/views/profile_view.dart';
import 'package:fashion_state/App/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPage {
  static var routes=[
      GetPage(
        name: AppRoutes.INITAIL,
        page: ()=>GetStartView()
      ),
      GetPage(
        name: AppRoutes.MAINVIEW,
        page: ()=>MainView()
      ),
      GetPage(
        name: AppRoutes.HOME,
        page: ()=>HomeView(),
      ),
      GetPage(
        name: AppRoutes.FAVORITE,
        page: ()=>FavoriteView(),
      ),
      GetPage(
        name: AppRoutes.HISTORY,
        page: ()=>HistoryView(),
      ),
      GetPage(
        name: AppRoutes.PROFILE,
        page: ()=>ProfileView(),
      ),
  ];
}