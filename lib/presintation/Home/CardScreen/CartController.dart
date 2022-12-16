
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/domain/entites/CartEntites.dart';
import 'package:shoping/domain/entites/ProductDetailsEntites.dart';
import 'package:shoping/presintation/Home/CardScreen/cartusecase.dart';

class CartController extends GetxController{
  final CartUseCase _cartUseCase;
  CartController(this._cartUseCase);
  late CartEntites cartEntites;
// late ProductDetailsEntites productDetailsEntites;
  var isloading=true;
  addProductToCart(id)async{
    final result=await _cartUseCase.exexutAddProductToCart(id);
    result.fold((l) {
      Get.defaultDialog(title: "Warning",middleText: l.message);
      update();
    }, (r) {
      Get.snackbar("Success", r.message,backgroundColor: Colors.green,
          duration: Duration(seconds: 2));
        getAllCart();
      update();
    });
    update();
  }

  getAllCart()async{
    isloading=true;
    update();
    final result=await _cartUseCase.exeuteGetAllCart();
    result.fold((l) {
      Get.defaultDialog(title: "Warning",middleText: l.message);
      update();
    }, (r) {
     cartEntites=r;
     //print("rrrr:${cartEntites}");
     update();
    });
    isloading=false;
    update();
  }

  removeProductFromCart(id)async{
    final Result=await _cartUseCase.exeuteRemoveFromCart(id);
    Result.fold((l) {
      Get.defaultDialog(title: "Warning",middleText: l.message);
      update();
    }, (r) {
      Get.snackbar("Success", "Product Deleted from Cart successfully",
          duration: Duration(seconds: 1));
      update();
    });
    update();
  }
}