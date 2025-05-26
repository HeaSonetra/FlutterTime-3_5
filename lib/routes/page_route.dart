
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:login_signup/bindings/auth_binding.dart';
import 'package:login_signup/routes/app_route.dart';
import 'package:login_signup/view/home_view.dart';
import 'package:login_signup/view/login_view.dart';
import 'package:login_signup/view/welcome_view.dart';

class AppPage {
  static final routes=[
        GetPage(
          name:AppRoute.INITIAL,
          page:()=>  WelcomeView(),
          binding: AuthBinding()
        ),
        GetPage(
          name:AppRoute.LOGIN,
          page:()=>  LoginView(),
          binding: AuthBinding()
        ),
        GetPage(
          name:AppRoute.HOME,
          page:()=>  HomeView(),
          binding: AuthBinding()
        )
  ];
}