import 'package:demo1/model/productModel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Text(
            'Wishlist',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.9,
          ),
          itemCount: listProduct.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.6),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Container(
                        width: 50,
                        height: 26,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            listProduct[index].status,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      listProduct[index].icon,
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 160,

                    child: listProduct[index].img,
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.only(top: 5,left: 20,right: 2),
                    child: Wrap(
                      children: [ 
                        Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        listProduct[index].name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                       )
                      ]
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(Icons.star,color: Colors.amber,),
                        Text('${listProduct[index].rate}')
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Text('${listProduct[index].dis} %',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Text('\$${listProduct[index].price} ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Acount',
          ),
        ]),
    );
  }
}
