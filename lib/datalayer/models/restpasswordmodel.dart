import 'package:shoping/domain/entites/restpasswordentites.dart';

class RestPasswordModel extends ResetPasswordEntities {
  const RestPasswordModel({required String token}) : super(token);

  factory RestPasswordModel.fromJson(Map<String,dynamic>json){
    return RestPasswordModel(token: json["token"]);
  }
}