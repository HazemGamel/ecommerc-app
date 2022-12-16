
import 'package:shoping/domain/entites/userEntites.dart';

class UserModel extends UserEntites{
  UserModel({required String id,required String name,required String email,
  required String? profileimage}) : super(id, name, email, profileimage);

  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        profileimage: json["profileimage"]);
  }

}