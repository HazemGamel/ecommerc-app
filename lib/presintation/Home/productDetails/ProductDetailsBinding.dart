

import 'package:get/get.dart';
import 'package:shoping/presintation/Home/productDetails/ProductDetailsUseCase.dart';
import 'package:shoping/presintation/Home/productDetails/productDetailsController.dart';

class ProductDetailsBinding extends Bindings{
  @override
  void dependencies() {
//    Get.lazyPut(() =>
//        ProductDetailsController(Get.find<ProductDetailsUseCase>()),fenix: true);
  Get.put(ProductDetailsController(Get.find<ProductDetailsUseCase>()));
  }

}