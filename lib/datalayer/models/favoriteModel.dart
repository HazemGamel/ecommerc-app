import 'package:shoping/domain/entites/favoriteEntites.dart';

class FavoriteModel extends FavoriteEntites{
const  FavoriteModel({required String status,required String message})
    : super(status, message);

factory FavoriteModel.fromJson(Map<String,dynamic>json)=>
    FavoriteModel(status: json["atatus"], message: json["mes"]);

}