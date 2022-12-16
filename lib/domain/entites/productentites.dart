
import 'package:equatable/equatable.dart';

class ProductEntites extends Equatable{
  final String id;
  final String title;
  final String imagecover;
  final int price;
  final double ratingavarage;

 const ProductEntites({
     required this.id,
    required  this.title,required this.imagecover,required this.price,
  required this.ratingavarage});

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,imagecover,price,ratingavarage];

}