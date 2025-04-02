import 'package:flutter/material.dart';
import 'package:stack/model/productModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
//Hello
class _HomePageState extends State<HomePage> {
  var counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.category, color: Colors.red),
                  Spacer(),
                  Icon(Icons.shop, color: Colors.grey),
                  SizedBox(width: 20),
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                    backgroundImage: AssetImage('asset/image/profile.jpg'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 360,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          helperStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                          border: InputBorder.none,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Icon(Icons.search, color: Colors.grey[600]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.tune_rounded, color: Colors.pink, size: 30),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    'Sport Shoe',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sort by',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                ],
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 1.24,
                ),
                itemCount: listProduct.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(listProduct[index].image),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    listProduct[index].favorite =
                                        !listProduct[index].favorite;
                                  });
                                },
                                child:
                                    (listProduct[index].favorite == false)
                                        ? Icon(Icons.favorite_border_outlined)
                                        : Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 20),
                            Text(
                              listProduct[index].name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 20),
                            Text(
                              '\$${listProduct[index].price}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 20),
                            for(var i=1;i<(listProduct[index].star);i++)
                            Icon(Icons.star,color: Colors.amber,),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  counter++;
                                  print('Counter=$counter');
                                });
                              },
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  shape: BoxShape.circle
                                ),
                                child: Center(
                                  child: Text('+',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
                                ),
                                
                              ),
                            ),
                            SizedBox(width: 10,)
                          ],
                        ),

                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
