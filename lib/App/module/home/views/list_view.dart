import 'package:fashion_state/App/module/home/controller/home_controller.dart';
import 'package:fashion_state/App/module/sizelayout/size_layout.dart';
import 'package:fashion_state/App/theme/color.dart';
import 'package:fashion_state/App/theme/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class List_View extends StatelessWidget {
  final HomeController _homeController=Get.find();
  

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Scaffold(
       body: Obx((){
         return Padding(
           padding: const EdgeInsets.all(10),
           child: Column(
            children: [
               SizedBox(height: AppSize.height(0.04),),
               Row(
                 children: [
                   IconButton(onPressed: ()=>Get.offAllNamed('/mainview'), icon: Icon(Icons.arrow_back)),
                   Container(
                      width: AppSize.width(0.8),
                      height: AppSize.height(0.05),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.forceground,
                      ),
                      child: TextField(
                        onChanged: (value) => _homeController.onSearchChange(value),
                        style: TextStyle(color:AppColor.textPrimary),
                        decoration: InputDecoration(
                          icon: Icon(Icons.search),
                          hintText: 'Search the cloth you need',
                          hintStyle: TextStyle(color:AppColor.grey),
                          border: InputBorder.none
                        ),
                      )
                    ),
                 ],
               ),
              Expanded(
                child: ListView.builder(
                  itemCount: _homeController.filterProduct.length,
                  itemBuilder: (context,index){
                    final productFilter=_homeController.filterProduct[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                            leading: Container(
                              width: AppSize.width(0.26),
                              height: AppSize.height(0.1),
                              
                              child: Image(image: AssetImage(productFilter.imageUrl)),
                            ),
                            title: Text(productFilter.name),
                            
                      ),
                    );
                  }),
              )
             
            ],
           ),
         );
       }),
    );
  }
}