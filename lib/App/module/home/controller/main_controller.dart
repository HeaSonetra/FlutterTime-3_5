

import 'package:get/get.dart';

class MainController extends GetxController {

    var selectIndex=0.obs;

    void changTab(int index){
         selectIndex.value=index;
    }
}