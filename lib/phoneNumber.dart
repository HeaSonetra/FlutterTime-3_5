import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signup_login/otpVerify.dart';
import 'package:signup_login/login_page.dart';

class Phonenumber extends StatelessWidget {
  var phonecontroller = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Text('Register', style: TextStyle(fontSize: 26)),
            SizedBox(height: 40),
            
            TextField(
              controller: phonecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "phone number",
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                String phone = phonecontroller.text.trim();
         
                if (phone.isEmpty || phone.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter all field")),
                  );
                } else {
                  try{
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: phone,
                      verificationCompleted:(PhoneAuthCredential credential) async{
                        await FirebaseAuth.instance.signInWithPhoneNumber(phone);
                      } , 
                      verificationFailed: (FirebaseAuthException e){
                         ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Verification failed: ${e.message}")),
                          );
                      }, 
                      codeSent: (String verificationId, int? resendToken){
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Otpscreen(otp: verificationId),
                        ),
                      );
                      }, 
                      codeAutoRetrievalTimeout: (String verificationId) {
                         // Called after timeout
                      },
                      timeout: const Duration(seconds: 60),
                  
                  );
                   } catch (err) {
                      print("Error: $err");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("An error occurred. Try again.")),
                      );
                    }
                }
              },
              child: Text("Get OTP"),
            ),
            SizedBox(height: 40),
           
          ],
        ),
      ),
    );
  }
}
