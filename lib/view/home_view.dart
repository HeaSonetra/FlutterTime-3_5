import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:login_signup/controller/auth_controller.dart';
import 'package:login_signup/view/login_view.dart';

class HomeView extends StatelessWidget {
  final AuthController _authController=Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
    
      drawer: Drawer(
        child: 
          ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.grey[600]),
                accountName: Text("Hea Sonetra"), 
                accountEmail: Obx(()=> Text("${_authController.email.value}")),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/image.png"),
                ),
               
              ),
               _buildDrawerItem(context,Icons.home,'Home'),
               _buildDrawerItem(context,Icons.home,'Home'),
               _buildDrawerItem(context,Icons.home,'Home'),
               _buildDrawerItem(context,Icons.home,'Home'),
               _buildDrawerItem(context,Icons.home,'Home'),
               _buildDrawerItem(context,Icons.logout,'Logout'),
            ],
          ),
        ),
      
    );
  }
  Widget _buildDrawerItem(BuildContext context,IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginView()));
      },
    );
  }
}