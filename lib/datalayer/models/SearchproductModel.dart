
import 'package:shoping/domain/entites/ProductDetailsEntites.dart';
import 'package:shoping/domain/entites/SearchProductEntites.dart';


class SearchProductModel extends SearchProductEntites{
  SearchProductModel({required String sId,required String title,
     required String description,required int quantity,
    required  int sold,required int price,required List<String> images,
     required SearchCategory? category,required SearchCategory? brand,
    required double ratingAverage,
     required int ratingQuantity,
    required  String id,
    required  String imageCover,
  }) :
        super(sId, title, description,
          quantity, sold, price, images, category,
          brand, ratingAverage, ratingQuantity, id,imageCover);

 factory SearchProductModel.fromJson(Map<String, dynamic> json) {
    return SearchProductModel(
        sId : json['_id'],
        title : json['title'],
        description : json['description'],
    imageCover: json["imageCover"],
    quantity : json['quantity'],
    sold : json['sold'],
    price : json['price'],
    images : List<String>.from(json["images"].map((e)=>e)),
    category : json['category'] != null
        ? new CategoryModel.fromJson(json['category'])
        : null,
    brand : json['brand'] != null ? new CategoryModel.fromJson(json['brand']) : null,
    ratingAverage : json['ratingAverage'].toDouble(),
    ratingQuantity : json['ratingQuantity'],
    id : json['id'],
    );
  }


}

class CategoryModel extends SearchCategory{
  CategoryModel({required String name}) : super(name);
  factory CategoryModel.fromJson(Map<String,dynamic>json){
    return CategoryModel(name: json["name"]);
  }

}





