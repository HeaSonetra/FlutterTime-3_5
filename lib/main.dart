import 'package:fashion_state/App/module/home/views/home_view.dart';
import 'package:fashion_state/App/routes/app_page.dart';
import 'package:fashion_state/App/routes/app_routes.dart';
import 'package:fashion_state/App/theme/dark.dart';
import 'package:fashion_state/App/theme/light.dart';
import 'package:fashion_state/App/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.INITAIL,
        getPages: AppPage.routes,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: _themeController.them,
      ),
    );
  }
}
