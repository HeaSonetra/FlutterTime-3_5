import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signup_login/home_page.dart';


class LoginPage extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log in")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Text('Log in', style: TextStyle(fontSize: 26)),
            SizedBox(height: 40),
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter email",
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: passcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter passwords",
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                String mail = emailcontroller.text.trim();
                String pass = passcontroller.text.trim();
                if (mail.isEmpty || pass.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter all field")),
                  );
                } else {
                   try{
                      FirebaseAuth.instance.signInWithEmailAndPassword(email: mail, password: pass).then((value){
                         ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: Text("Succes")));
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      });
                      
                   }catch(err){
                    print(err);
                   }
                }
              },
              child: Text("Log in"),
            ),
            SizedBox(height: 40),
            Text("Do you have an acount? sign up"),
          ],
        ),
      ),
    );
  }
}
