import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class AppSize {
  static late MediaQueryData _mediaQuery;
  static late double screenWidth;
  static late double screenHeight;

   static void init(BuildContext context){
    _mediaQuery=MediaQuery.of(context);
    screenWidth=_mediaQuery.size.width;
    screenHeight=_mediaQuery.size.height;
  }
  static double height(double value){
    return screenHeight*value;
  }
  static double width(double value){
    return screenWidth*value;
  }
}