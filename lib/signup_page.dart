import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signup_login/login_page.dart';

class SignupPage extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Text('Sign Up', style: TextStyle(fontSize: 26)),
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
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: mail,
                          password: pass,
                        );
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Create success")));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  } on FirebaseAuthException catch (e) {
                    String errorMessage = "An error occurred";
                    if (e.code == 'email-already-in-use') {
                      errorMessage = "Email already in use";
                    } else if (e.code == 'invalid-email') {
                      errorMessage = "Invalid email";
                    } else if (e.code == 'weak-password') {
                      errorMessage = "Password should be at least 6 characters";
                    }
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(errorMessage)));
                    print(e);
                  }
                }
              },
              child: Text("SignUp"),
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
              },
              child: Text("Already have an acount? click here")),
          ],
        ),
      ),
    );
  }
}
