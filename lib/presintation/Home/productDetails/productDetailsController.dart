
import 'package:get/get.dart';
import 'package:shoping/domain/entites/ProductDetailsEntites.dart';
import 'package:shoping/presintation/Home/productDetails/ProductDetailsUseCase.dart';

class ProductDetailsController extends GetxController{
  final ProductDetailsUseCase _productDetailsUseCase;
  late ProductDetailsEntites productDetailsEntites;
  List<Reviews> reviews=[];
  ProductDetailsController(this._productDetailsUseCase);
  var isloading =true;

  getProductDetails(id)async{
    isloading=true;
    final result= await _productDetailsUseCase.executeProductDetails(id);
    result.fold((l) {
      Get.defaultDialog(title: "warning",middleText: l.message);
    }, (r) {
      productDetailsEntites=r;
      //print(productDetailsEntites);
      reviews.addAll(r.reviews!);
      update();
    });
    isloading=false;
    update();
  }


//  getReviews(){
//    isloading=true;
//    reviews.addAll(productDetailsEntites.reviews!) ;
//    isloading=false;
//    //update();
//    //print("reviews:${reviews}");
//  }
}