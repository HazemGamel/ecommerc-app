
import 'package:shoping/datalayer/models/responsedata.dart';
import 'package:shoping/domain/entites/registerresponseentites.dart';

class RegisterResponseModel extends RegisterResponseEntity{
  const RegisterResponseModel(
  {required Data? data, required String? token}) : super(data, token);



factory RegisterResponseModel.fromjson(Map<String,dynamic>json)=>
    RegisterResponseModel(
        data:json["data"] !=null ? DataModel.fromjson(json["data"]):null,
        token:json["token"]);

}