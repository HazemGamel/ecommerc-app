
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/domain/entites/SearchProductEntites.dart';
import 'package:shoping/presintation/Home/search/searchusecase.dart';

class SearchController extends GetxController{

  final SearchUseCase searchUseCase;

  SearchController(this.searchUseCase);
  //late SearchProductEntites searchProductEntites;
  var products=<SearchProductEntites>[].obs ;
  TextEditingController searchController=TextEditingController();

  //var isloading =true;

  searchProduct(text)async{
     text = text.toLowerCase();
    //isloading=true;
    final result=await searchUseCase.execuiteSearch(text);
    result.fold((l) {
      Get.defaultDialog(title:"Warning",
          middleText: l.message);
      update();
    }, (r) {
    var x = r.where((element) {
   var search = element.title.toLowerCase();
     return search.contains(text);
    }
    ).toList();
      products.value=x;
      print("products :$products");
      update();
    });
    //isloading=false;
    update();
  }
  removesearch(){
    searchController.clear();
    //searchProduct("");
  }
}