import 'package:equatable/equatable.dart';


class SearchProductEntites extends Equatable{
final  String sId;
final  String title;
final  String imageCover;
final String description;
final  int quantity;
final  int sold;
final  int price;
final  List<String> images;
final  SearchCategory? category;
final  SearchCategory? brand;
final  double ratingAverage;
final  int ratingQuantity;
final  String id;

 const SearchProductEntites(
      this.sId, this.title, this.description,
        this.quantity, this.sold, this.price,
        this.images,
        this.category,
        this.brand,
        this.ratingAverage,
        this.ratingQuantity,
        this.imageCover,
        this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [sId,title,description,quantity,sold,price,images,category
  ,brand,ratingAverage,ratingQuantity,id,imageCover];

//  Data.fromJson(Map<String, dynamic> json) {
//    sId = json['_id'];
//    title = json['title'];
//    description = json['description'];
//    quantity = json['quantity'];
//    sold = json['sold'];
//    price = json['price'];
//    images = json['images'].cast<String>();
//    category = json['category'] != null
//        ? new Category.fromJson(json['category'])
//        : null;
//    brand = json['brand'] != null ? new Category.fromJson(json['brand']) : null;
//    ratingAverage = json['ratingAverage'];
//    ratingQuantity = json['ratingQuantity'];
//    if (json['reviews'] != null) {
//      reviews = <Reviews>[];
//      json['reviews'].forEach((v) {
//        reviews!.add(new Reviews.fromJson(v));
//      });
//    }
//    id = json['id'];
//  }


}

 class SearchCategory extends Equatable{
 final String name;
 const SearchCategory(this.name);

  @override
  // TODO: implement props
  List<Object?> get props => [name];

//  Category.fromJson(Map<String, dynamic> json) {
//    name = json['name'];
//  }


}
//
//class Reviews extends Equatable {
//final  String? sId;
//final  String? title;
//final  int? ratings;
//final  User? user;
//final  String? product;
//final  String? createdAt;
//final  String? updatedAt;
//final  int? iV;
//
//const  Reviews(
//      this.sId,
//        this.title,
//        this.ratings,
//        this.user,
//        this.product,
//        this.createdAt,
//        this.updatedAt,
//        this.iV);
//
////  Reviews.fromJson(Map<String, dynamic> json) {
////    sId = json['_id'];
////    title = json['title'];
////    ratings = json['ratings'];
////    user = json['user'] != null ? new User.fromJson(json['user']) : null;
////    product = json['product'];
////    createdAt = json['createdAt'];
////    updatedAt = json['updatedAt'];
////    iV = json['__v'];
////  }
//
//
//  @override
//  // TODO: implement props
//  List<Object?> get props => [sId,title,ratings,user,product,createdAt,updatedAt,iV];
//}
//
//class User extends Equatable{
//final  String? sId;
//final  String? name;
//final  String? profileimage;
//
//const  User(this.sId, this.name, this.profileimage);
//
//  @override
//  // TODO: implement props
//  List<Object?> get props => [sId,name,profileimage];
//
////  User.fromJson(Map<String, dynamic> json) {
////    sId = json['_id'];
////    name = json['name'];
////    profileimage = json['profileimage'];
////  }
//
//
//}