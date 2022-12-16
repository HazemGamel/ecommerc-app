
import 'package:shoping/domain/entites/ProductDetailsEntites.dart';

//class ProductDetailsModel extends ProductDetailsEntites{
////const  ProductDetailsModel({required Data? data}) : super(data);
////factory  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
////    return ProductDetailsModel(
////        data:json['data']!= null ? new DataModel.fromJson(json['data']) : null
////        );
////  }
//
//}

class ProductDetailsModel extends ProductDetailsEntites{
  ProductDetailsModel({required String sId,required String title,
     required String description,required int quantity,
    required  int sold,required int price,
    required List<String> images,
    required List<Reviews>? reviews,
     required Category? category,required Category? brand,
    required double ratingAverage,
     required int ratingQuantity,
    required  String id,
    required  String imageCover,
  }) :
        super(sId, title, description,
          quantity, sold, price, images,reviews, category,
          brand, ratingAverage, ratingQuantity, id,imageCover);

 factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
        sId : json['_id'],
        title : json['title'],
        description : json['description'],
    imageCover: json["imageCover"],
    quantity : json['quantity'],
    sold : json['sold'],
    price : json['price'],
    images : List<String>.from(json["images"].map((e)=>e)),
    reviews: List<ReviewModel>.from((json["reviews"] as List)
          .map((e) => ReviewModel.fromJson(e))),
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

class CategoryModel extends Category{
  CategoryModel({required String name}) : super(name);
  factory CategoryModel.fromJson(Map<String,dynamic>json){
    return CategoryModel(name: json["name"]);
  }

}


class ReviewModel extends Reviews{
  ReviewModel(
  {required String? sId,required String? title,required double? ratings,
    required UserReviewEntites? user,
  required String? product,required String? createdAt,required String? updatedAt,
  required int? iV}) : super(sId, title,
      ratings, user, product, createdAt, updatedAt, iV);

  factory ReviewModel.fromJson(Map<String,dynamic>json){
    return ReviewModel(
        sId: json["_id"],
        title: json["title"],
        ratings: json["ratings"].toDouble(),
        user: json["user"] != null?
        UserReviewModel.fromJson(json['user']):null,
        product: json["product"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        iV: json["__v"]
    );
  }

}


class UserReviewModel extends UserReviewEntites{
  UserReviewModel({required String? sId,required String? name,
  required String? profileimage}) : super(sId, name, profileimage);

  factory UserReviewModel.fromJson(Map<String,dynamic>json){
  return UserReviewModel(
      sId: json["_id"],
      name: json["name"],
      profileimage: json["profileimage"]);
  }
}

