import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_signup/routes/app_route.dart';
import 'package:login_signup/routes/page_route.dart';

class AuthController extends GetxController {
     final RxBool isloading=false.obs;
     final RxBool islogin=false.obs;
     final RxString email=''.obs;
     final box=GetStorage();

     final Map<String,String>  _user={
      'demo@gmail.com':'pass123'
     };
     
     Future<void> login(String email,String pass)async{
        isloading.value=true;
        await Future.delayed(Duration(seconds: 1));

        if(_user[email]==pass){
          isloading.value=true;
          this.email.value=email;
          Get.offAllNamed('/home');
          Get.snackbar("success", "Loged successfully");
        }else{
          Get.snackbar("Error", "Not Match");
        }
        isloading.value=false;
     }
     Future<void> singUp(String email,String pass)async{
        isloading.value=true;
        await Future.delayed(Duration(seconds: 1));

        if(_user.containsKey(email)){
            Get.snackbar('Error','email already exists');
        }else{
            isloading.value=true;
            Get.offAllNamed('/login');
            Get.snackbar('success','create  successfully');
        }
        isloading.value=false;
     }
}