
import 'package:fashion_state/App/Data/model/category_model.dart';
import 'package:fashion_state/App/Data/model/product_model.dart';

class ProductService {
  Future<List<CategoryModel>>  fetchCategory()async{
    await Future.delayed(Duration(microseconds: 1000));
    return [
        CategoryModel(id: 1, name: 'Jacket', iconUrl:'assets/icons/jacket.png' ),
        CategoryModel(id: 2, name: 'T-shirt', iconUrl:'assets/icons/shirts.png' ),
        CategoryModel(id: 2, name: 'T-shirt', iconUrl:'assets/icons/shirts.png' ),
        CategoryModel(id: 2, name: 'T-shirt', iconUrl:'assets/icons/shirts.png' ),
        CategoryModel(id: 2, name: 'T-shirt', iconUrl:'assets/icons/shirts.png' ),
    ];
  }
  Future<List<ProductModel>>  fetchProduct()async{
    await Future.delayed(Duration(microseconds: 1000));
    return [
        ProductModel(id: 1, name: "Twill soft shirt", price: 32.39, imageUrl: 'assets/images/Twill.webp', categoryId: 2),
        ProductModel(id: 2, name: "Jacket flee", price: 36.38, imageUrl: 'assets/images/jacket_flee.webp', categoryId: 1),
        ProductModel(id: 3, name: "Jean", price: 34.38, imageUrl: 'assets/images/jacket_flee.webp', categoryId: 1),
        ProductModel(id: 4, name: "Short", price: 32.38, imageUrl: 'assets/images/jacket_flee.webp', categoryId: 1),
        ProductModel(id: 5, name: "Shoes", price: 33.38, imageUrl: 'assets/images/jacket_flee.webp', categoryId: 2),
    ];
  }
}