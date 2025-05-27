import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:login_signup/controller/auth_controller.dart';
import 'package:login_signup/routes/app_route.dart';
import 'package:login_signup/widget/auth_textfield.dart';

class LoginView extends StatelessWidget {
  final AuthController _auth=Get.find();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80,),
                AuthTextfield(
                  controller: _emailController, 
                  label:'email', icon: Icons.email
                ),
                SizedBox(height: 20,),
                AuthTextfield(
                  controller: _passwordController, 
                  label:'Password', icon: Icons.lock,
                  isPasswords: true,
                ),
                SizedBox(height: 20,),
                Obx(()
                   => (_auth.isloading.value)?CircularProgressIndicator()
                   :
                   ElevatedButton(onPressed:(){
                    _auth.login(_emailController.text.trim(),_passwordController.text.trim());
                   }, child: Text("Login"))
                
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Text("Do you have an acount?"),
                    SizedBox(width: 20,),
                    TextButton(onPressed: ()=>Get.toNamed(AppRoute.SIGNUP)
                        
                    , child:Text("SignUp"))
                  ],
                )
              ],
            ),
          
        ),
      ),
    );
  }
}