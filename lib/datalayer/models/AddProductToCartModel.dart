
import 'package:shoping/domain/entites/AddProductToCartEntites.dart';

class AddProductToCartModel extends AddProductToCartEntites{
 const AddProductToCartModel({required String status,required String message})
      : super(status, message);

 factory AddProductToCartModel.fromJson(Map<String,dynamic>json){
   return AddProductToCartModel(
       status: json["status"],
       message: json["msg"]);
 }
}