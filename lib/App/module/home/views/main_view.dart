
import 'package:fashion_state/App/module/home/controller/main_controller.dart';
import 'package:fashion_state/App/module/home/views/favorite_view.dart';
import 'package:fashion_state/App/module/home/views/history_view.dart';
import 'package:fashion_state/App/module/home/views/home_view.dart';
import 'package:fashion_state/App/module/home/views/profile_view.dart';
import 'package:fashion_state/App/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainView extends StatelessWidget {
  final MainController mainController=Get.put(MainController());

  final List<Widget>  pages=[
        HomeView(),
        FavoriteView(),
        HistoryView(),
        ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
           body: pages[mainController.selectIndex.value],
           bottomNavigationBar: Obx(()
            =>BottomNavigationBar(
            currentIndex: mainController.selectIndex.value,
            onTap: mainController.changTab,
            selectedItemColor: AppColor.primary,
            unselectedItemColor: AppColor.grey,
            type: BottomNavigationBarType.fixed,
            items: [
                 BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                 BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
                 BottomNavigationBarItem(icon: Icon(Icons.history),label: 'History'),
                 BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
            ])
           ),
          
      ),
    );
  }
}