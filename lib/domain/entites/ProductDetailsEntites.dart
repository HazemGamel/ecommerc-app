import 'package:equatable/equatable.dart';

//class ProductDetailsEntites extends Equatable {
// final Data? data;
// const ProductDetailsEntites(this.data);
//
//  @override
//  // TODO: implement props
//  List<Object?> get props => [data];
//
////  ProductDetailsEntites.fromJson(Map<String, dynamic> json) {
////    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
////  }
//
//}

class ProductDetailsEntites extends Equatable{
final  String sId;
final  String title;
final  String imageCover;
final String description;
final  int quantity;
final  int sold;
final  int price;
final  List<String> images;
final List<Reviews>? reviews;
final  Category? category;
final  Category? brand;
final  double ratingAverage;
final  int ratingQuantity;
final  String id;

 const ProductDetailsEntites(
      this.sId, this.title, this.description,
        this.quantity, this.sold, this.price,
        this.images,
        this.reviews,
        this.category,
        this.brand,
        this.ratingAverage,
        this.ratingQuantity,
        this.imageCover,
        this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [sId,title,description,
   quantity,sold,price,images,reviews,category
  ,brand,ratingAverage,ratingQuantity,id,imageCover];



}

 class Category extends Equatable{
 final String name;

 const Category(this.name);

  @override
  // TODO: implement props
  List<Object?> get props => [name];




}

class Reviews extends Equatable {
final  String? sId;
final  String? title;
final  double? ratings;
final  UserReviewEntites? user;
final  String? product;
final  String? createdAt;
final  String? updatedAt;
final  int? iV;

const  Reviews(
      this.sId,
        this.title,
        this.ratings,
        this.user,
        this.product,
        this.createdAt,
        this.updatedAt,
        this.iV);



  @override
  // TODO: implement props
  List<Object?> get props => [sId,title,ratings,user,
    product,createdAt,updatedAt,iV];
}

class UserReviewEntites extends Equatable{
final  String? sId;
final  String? name;
final  String? profileimage;

const  UserReviewEntites(this.sId, this.name, this.profileimage);

  @override
  // TODO: implement props
  List<Object?> get props => [sId,name,profileimage];


}