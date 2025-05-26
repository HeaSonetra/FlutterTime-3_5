import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/routes/app_route.dart';
import 'package:login_signup/routes/page_route.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.INITIAL,
      getPages:AppPage.routes,
    )
  );
}

