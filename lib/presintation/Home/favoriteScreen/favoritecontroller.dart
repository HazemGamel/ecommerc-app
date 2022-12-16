import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/domain/entites/productentites.dart';
import 'package:shoping/presintation/Home/HomeScreen/HomeController.dart';
import 'package:shoping/presintation/Home/favoriteScreen/FavoritUseCase.dart';

class FavoriteController extends GetxController{
  final FavoriteUseCase _favoriteUseCase;
  //var products=<ProductEntites>[].obs ;
 var products=[];
  var isloading = true.obs;
  Map isFavorite= {};
  FavoriteController(this._favoriteUseCase);
  setFavorite(String id,val){
    isFavorite[id]=val;
    update();
  }
  AddProductsToFav(String id)async{
    final result = await _favoriteUseCase.executeAddProduct(id);
    result.fold((l) {
      Get.defaultDialog(title: "warning", middleText: l.message);
      update();
    },(r) {
      if(r.status=="success"){
        Get.rawSnackbar(title: "Success",message: r.message,
            backgroundColor: Colors.green);
        GetUserFavorite(id);
        update();
      }else{
        print("errr");
      }
    });
    update();
  }

  removeProductFromFav( id)async{
    final result = await _favoriteUseCase.executeRemoveProduct(id);
    result.fold((l) {
      Get.defaultDialog(title: "warning", middleText: l.message);
      update();
    },(r) {
      if(r.status=="success"){
        Get.rawSnackbar(title: "Success",message: r.message,
            backgroundColor: Colors.green);
       var x= products.indexWhere((element) => element.id==id);
        products.removeAt(x);
        update();
      }else{
        print("errr");
      }
    });
    update();
  }

  GetUserFavorite(String productId)async{
    final result = await _favoriteUseCase.executeGetUserFavorite();
    result.fold((l) {
      Get.defaultDialog(title: "warning", middleText: l.message);
      update();
    },(r) {
      products.add(r.firstWhere((element) => element.id==productId));

      update();
      //print("products${products}");
    });
  }

@override
  void onInit() {
    super.onInit();
    //GetUserFavorite(productid);
  }
}