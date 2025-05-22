import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_demo/view/homePage.dart';
import 'package:google_fonts/google_fonts.dart';

class GetstartPage extends StatelessWidget {
  const GetstartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    double widthSize=size.width;
    double heightSize=size.height;
    return Scaffold(
      
      body: Stack(
        children: [ 
          Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue[900]!,
                Colors.blue[300]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
        ),
        Positioned(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[ 
                //Image(image: AssetImage("assets/run.gif")),
                SizedBox(height: size.height*0.02,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Homepage()));
                  },
                  child: Container(
                  width:widthSize*0.5,
                  height: heightSize*0.08,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Center(child: Text("Get Start",style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green),)),
                                ),
                ),
              ]
            ),
          )
        )
        ]
      ),
    );
  }
}