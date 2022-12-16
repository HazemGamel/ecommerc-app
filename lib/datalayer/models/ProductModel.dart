
import 'package:shoping/domain/entites/productentites.dart';

class ProductModel extends ProductEntites{
  ProductModel({
    required String id,
    required  String title,required String imagecover,required  int price,
    required double ratingavarage}) : super(id: id,title: title,imagecover: imagecover
      ,price: price,ratingavarage: ratingavarage);

  factory ProductModel.fromJson(Map<String,dynamic> json)=>
      ProductModel(id: json["_id"],
          title: json["title"],
          imagecover: json["imageCover"],
          price: json["price"],
          ratingavarage: json["ratingAverage"].toDouble());

}