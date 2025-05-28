import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_signup/routes/app_route.dart';
import 'package:login_signup/routes/page_route.dart';

class AuthController extends GetxController {
     final RxBool isloading=false.obs;
     final RxBool islogin=false.obs;
     final RxString email=''.obs;
     final box=GetStorage();

      

    void onInit() {
      super.onInit();
      GetStorage.init(); // Initialize GetStorage
    }
     
     Future<void> login(String email,String pass)async{
        isloading.value=true;
        await Future.delayed(Duration(seconds: 1));
        final storePassword=box.read(email);
        if(storePassword!=null&&storePassword==pass){
          isloading.value=true;
          this.email.value=email;
          Get.offAllNamed('/home');
          Get.snackbar("success", "Loged successfully");
        }else{
          Get.snackbar("Error", "Not Match");
        }
        isloading.value=false;
     }
     Future<void> singUp(
      String email,
      String password,
      String confirmPassword,
     )async{
        isloading.value=true;
        await Future.delayed(Duration(seconds: 1));
        
        if(password==confirmPassword){
          final check=box.read(email);
          if(check==null){
              box.write(email,password);
              Get.snackbar('Success', "Signup successful");
              Get.offAllNamed('/login');
          }else{
              Get.snackbar('Error', "This email already exists");
          }
          
        }else{
          Get.snackbar('Error', "Password not match");
        }
       isloading.value=false;
     }

     var isPasswordHind=true.obs;
     void toggleHindPass(){
          isPasswordHind.value=!isPasswordHind.value;
     }
}