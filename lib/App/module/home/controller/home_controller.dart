import 'package:fashion_state/App/Data/model/category_model.dart';
import 'package:fashion_state/App/Data/model/product_model.dart';
import 'package:fashion_state/App/Data/service/product_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ProductService _productService = Get.put(ProductService());

  RxList<CategoryModel> categorise = <CategoryModel>[].obs;
  RxList<ProductModel> product = <ProductModel>[].obs;
  RxBool isloading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    load_data();
  }

  void load_data() async {
    isloading.value = true;
    try {
      categorise.value = await _productService.fetchCategory();
      product.value = await _productService.fetchProduct();
    } catch (e) {
      Get.snackbar('Error', 'Error not have data yet');
    }
  }
}
