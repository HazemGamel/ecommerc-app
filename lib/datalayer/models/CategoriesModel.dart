import 'package:shoping/domain/entites/CategoriesEntites.dart';

class CategoriesModel extends CategoriesEntities{
const  CategoriesModel({
    required String id,
    required String categoryname,
    required String categoryimage,
}) : super(id: id,categoryname: categoryname,categoryimage: categoryimage);

factory CategoriesModel.fromJson(Map<String,dynamic>json)=>
    CategoriesModel(
        id: json["_id"],
        categoryname: json["name"],
        categoryimage: json["image"]);

}