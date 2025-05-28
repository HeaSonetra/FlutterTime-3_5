import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:login_signup/controller/auth_controller.dart';
import 'package:login_signup/widget/auth_textfield.dart';

class SignUpView extends StatelessWidget {
  final AuthController _authController=Get.find();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passController=TextEditingController();
  final TextEditingController _confirmPassController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80,),
              AuthTextfield(
                controller: _emailController,
                 label: 'email', icon: Icons.email
              ),
              SizedBox(height: 20,),

              AuthTextfield(
                controller: _passController,
                 label: 'password', icon: Icons.email,
                 isPasswords: true,
              ),
              SizedBox(height: 20,),

              AuthTextfield(
                controller: _confirmPassController,
                 label: 'confirm Password', icon: Icons.email,
                 isPasswords: true,
              ),
              SizedBox(height: 20,),
              Obx(()=>(_authController.isloading.value)?CircularProgressIndicator():
              ElevatedButton(
                onPressed: (){
                  
                  _authController.singUp(_emailController.text.trim(), _passController.text.trim(),_confirmPassController.text.trim());
                },
                child: Text('SignUp')))
            ],
          ),
        ),
      ),
    );
  }
}