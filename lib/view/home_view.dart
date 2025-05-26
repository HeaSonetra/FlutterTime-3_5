import 'package:flutter/material.dart';
import 'package:login_signup/view/login_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[600]),
              accountName: Text("Hea Sonetra"), 
              accountEmail: Text("heasonetra1232"),
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