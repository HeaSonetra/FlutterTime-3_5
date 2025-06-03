
import 'package:fashion_state/App/module/home/views/get_start_view.dart';
import 'package:fashion_state/App/module/home/views/home_view.dart';
import 'package:fashion_state/App/routes/app_routes.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPage {
  static var routes=[
      GetPage(
        name: AppRoutes.INITAIL,
        page: ()=>GetStartView()
      ),
      GetPage(
        name: AppRoutes.HOME,
        page: ()=>HomeView(),
      )
  ];
}