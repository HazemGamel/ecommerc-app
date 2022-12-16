
import 'package:get/get.dart';
import 'package:shoping/app/constance/statusRequest.dart';
import 'package:shoping/datalayer/models/CategoriesModel.dart';
import 'package:shoping/domain/entites/BrandingEntites.dart';
import 'package:shoping/domain/entites/CategoriesEntites.dart';
import 'package:shoping/domain/entites/productentites.dart';
import 'package:shoping/presintation/Home/HomeScreen/HomeUseCase.dart';
import 'package:shoping/presintation/Home/favoriteScreen/favoritecontroller.dart';

class HomeController extends GetxController{
  final HomeUseCase _homeUseCase;
  HomeController(this._homeUseCase);
  StatesRequest? statesRequest;
  var isloading = true.obs;
  var isadded = true.obs;
  var categories=<CategoriesEntities>[].obs;
  var brands=<BrandsEntities>[].obs ;
  var products=<ProductEntites>[].obs ;

  getCategories()async{
//  statesRequest = StatesRequest.loading;
//  update();
  isloading.value= true;
    final result = await _homeUseCase.executeCategories();
  result.fold((l) {
    Get.defaultDialog(title: "warning", middleText: l.message);
    update();
  },(r) {
    categories.addAll(r);
//    r.forEach((element) {
//      categories!.add(element);
//    });
    //update();
//    statesRequest = StatesRequest.success;
//    update();
  });
  isloading.value= false;

}

  getBrands()async{
    isloading.value= true;
    final result = await _homeUseCase.executeBrands();
    result.fold((l) {
      Get.defaultDialog(title: "warning", middleText: l.message);
      update();
    },(r) {
      brands.addAll(r);
    });
    isloading.value= false;
  }

  getProducts()async{
    isloading.value= true;
    final result = await _homeUseCase.executeProducts();
    result.fold((l) {
      Get.defaultDialog(title: "warning", middleText: l.message);
      update();
    },(r) {
      products.addAll(r);

    });
    isloading.value= false;
  }

  @override
  void onInit() {
    super.onInit();
    getCategories();
    getBrands();
    getProducts();
  }
}