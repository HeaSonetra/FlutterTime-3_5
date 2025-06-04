import 'package:fashion_state/App/Data/service/product_service.dart';
import 'package:fashion_state/App/module/home/controller/home_controller.dart';
import 'package:fashion_state/App/module/sizelayout/size_layout.dart';
import 'package:fashion_state/App/theme/color.dart';
import 'package:fashion_state/App/theme/font.dart';
import 'package:fashion_state/App/theme/imageUrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashion_state/App/theme/theme_controller.dart';

class HomeView extends StatelessWidget {
  final ThemeController _themeController = Get.find();
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              SizedBox(height: AppSize.height(0.02)),
              Text("Fashion shop", style: AppFont.title.copyWith(fontSize: 26)),
              SizedBox(height: AppSize.height(0.01)),
              Text("Get pupular fashion from home", style: AppFont.subtitle),
              SizedBox(height: AppSize.height(0.02)),

              Container(
                width: AppSize.width(0.9),
                height: AppSize.height(0.05),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.forceground,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search the clothes you need',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: AppSize.height(0.02)),
              Row(
                children: [
                  Text("Categorise", style: AppFont.title),
                  Spacer(),
                  Text(
                    "See All",
                    style: AppFont.subtitle.copyWith(color: Colors.red),
                  ),
                ],
              ),
              SizedBox(height: AppSize.height(0.02)),
              SizedBox(
                height: AppSize.height(0.12),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _homeController.categorise.length,
                  itemBuilder: (context, index) {
                    final categorise = _homeController.categorise[index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: AppSize.width(0.24),
                      decoration: BoxDecoration(
                        color: AppColor.forceground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: AppSize.width(0.14),
                            height: AppSize.height(0.08),
                            //color: Colors.amber,
                            child: Image(image: AssetImage(categorise.iconUrl)),
                          ),
                          SizedBox(height: AppSize.height(0.008)),
                          Text(
                            categorise.name,
                            style: AppFont.title.copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: AppSize.height(0.03)),
              Row(
                children: [
                  Text("Pupular  Fashion", style: AppFont.title),
                  Spacer(),
                  Text(
                    "See All",
                    style: AppFont.subtitle.copyWith(color: Colors.red),
                  ),
                ],
              ),
              SizedBox(height: AppSize.height(0.03)),

              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                  crossAxisSpacing: AppSize.width(0.02),
                  mainAxisSpacing: AppSize.height(0.018),
                ),
                itemCount: _homeController.product.length,
                itemBuilder: (context, index) {
                  final product= _homeController.product[index];
                  return Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: AppSize.width(0.47),
                          height: AppSize.height(0.14),
                          decoration: BoxDecoration(
                            color: AppColor.forceground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Positioned(
                        left: AppSize.height(0.0172),
                        child: Container(
                          height: AppSize.height(0.18),
                          width: AppSize.width(0.4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 226, 222, 222),),
                            child: Center(
                              child: Image(image: AssetImage(product.imageUrl)),
                            ),
                        ),
                      ),
                      Positioned(
                        bottom: AppSize.height(0.08),
                        right: AppSize.width(0.07),
                        child:Container(
                                width: AppSize.width(0.075),
                                height: AppSize.height(0.036),
                                decoration: BoxDecoration(
                                  //borderRadius: BorderRadius.circular(10),
                                  color: Colors.black,
                                  shape: BoxShape.circle
                                  
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.amber,size: 18,)),
                                ),
                        ) 
                      ),
                      Positioned(
                        left: AppSize.width(0.02),
                        bottom: AppSize.height(0.016),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name,style: AppFont.subtitle.copyWith(fontWeight: FontWeight.w600,color: Colors.black),),
                            Text("\$${product.price}",style: AppFont.title,),
                          ],
                        )
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Row(
          children: [
            SizedBox(width: AppSize.width(0.02)),
            CircleAvatar(backgroundImage: AssetImage(Imageurl.profile)),
          ],
        ),
        actions: [
          Icon(Icons.shopping_cart, size: 30),
          Obx(
            () => IconButton(
              icon: Icon(
                _themeController.isDarkMode.value
                    ? Icons.toggle_on
                    : Icons.toggle_off,
                size: 40,
              ),
              onPressed: () => _themeController.toggleTheme(),
            ),
          ),
        ],
      ),
    );
  }
}
