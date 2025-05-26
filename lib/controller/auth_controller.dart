import 'package:get/get.dart';
import 'package:login_signup/routes/app_route.dart';
import 'package:login_signup/routes/page_route.dart';

class AuthController extends GetxController {
     final RxBool isloading=false.obs;
     final RxBool islogin=false.obs;
     final RxString email=''.obs;


     final Map<String,String>  _user={
      'demo@gmail.com':'pass123'
     };
     
     Future<void> login(String email,String pass)async{
        isloading.value=true;
        await Future.delayed(Duration(seconds: 1));

        if(_user[email]==pass){
          isloading.value=true;
          
          Get.offAllNamed('/home');
          Get.snackbar("success", "Loged successfully");
        }else{
          Get.snackbar("Error", "Not Match");
        }
        isloading.value=false;
     }
}