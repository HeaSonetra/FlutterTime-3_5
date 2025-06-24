import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup_login/home_page.dart';

class Otpscreen extends StatefulWidget {
  String otp;
  
  Otpscreen({required this.otp,super.key});
 
 
  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
   var Otpcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Text('Sign Up', style: TextStyle(fontSize: 26)),
            SizedBox(height: 40),
           
            TextField(
              controller: Otpcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter passwords",
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
               
                String Otp = Otpcontroller.text.trim();
                if (Otp.isEmpty || Otp.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter all field")),
                  );
                } else {
                  try {
                    await  FirebaseAuth.instance.verifyPhoneNumber(verificationCompleted: (PhoneAuthCredential credentail){}, verificationFailed: (err){}, codeSent: (otp,token){}, codeAutoRetrievalTimeout: (otp){},phoneNumber: Otp);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  } catch (err) {
                    print(err);
                  }
                }
              },
              child: Text("Verify"),
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
              },
              child: Text("Already have an acount? click here")),
          ],
        ),
      ),
    );
  }
}