
import 'package:shoping/domain/entites/BrandingEntites.dart';

class BrandsModel extends BrandsEntities{
  const  BrandsModel({
    required String id,
    required String brandname,
    required String brandimage,
  }) : super(id: id,brandname: brandname,brandimage: brandimage);

  factory BrandsModel.fromJson(Map<String,dynamic>json)=>
      BrandsModel(
          id: json["_id"],
          brandname: json["name"],
          brandimage: json["image"]);

}