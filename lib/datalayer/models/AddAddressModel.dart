
import 'package:shoping/domain/entites/addAddressEntites.dart';

class AddAddressModel extends AddAddressEntites{
  AddAddressModel({required String Status,required String message})
      : super(Status, message);
  factory AddAddressModel.fromJson(Map<String,dynamic>json){
    return AddAddressModel(
        Status: json["atatus"],
        message: json["mes"]);
  }
}