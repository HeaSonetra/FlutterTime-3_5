import 'package:fashion_state/App/module/sizelayout/size_layout.dart';
import 'package:fashion_state/App/theme/color.dart';
import 'package:fashion_state/App/theme/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Scaffold(
           body: Stack(
             children:[ Container(
              width: AppSize.width(1),
              height: AppSize.height(1),
              color: AppColor.background,
             ),
             Center(
               child: Positioned(
                child: InkWell(
                  onTap:()=> Get.offAllNamed('/home'),
                  child: Container(
                    width: AppSize.width(0.6),
                    height: AppSize.height(0.08),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.primary
                    ),
                    child: Center(
                      child: Text("Get Start",style: AppFont.title.copyWith(fontSize: 30),),
                    ),
                  ),
                )
               ),
             )
             ]
           ),
    );
  }
}