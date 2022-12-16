import 'package:shoping/domain/entites/registerresponseentites.dart';

class DataModel extends Data{
  DataModel({required String? id,required  String? name,required String? email,
  required String? role})
      : super(id, name, email, role);

  factory DataModel.fromjson(Map<String,dynamic> json)=>
      DataModel(id:json["_id"],
          name:json["name"],
          email:json["email"],
          role:json["role"]);
}