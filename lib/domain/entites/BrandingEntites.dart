import 'package:equatable/equatable.dart';

class BrandsEntities extends Equatable{
  final String id;
  final String brandname;
  final String brandimage;

  const  BrandsEntities({
    required this.id,required this.brandname,required this.brandimage});

  @override
  // TODO: implement props
  List<Object?> get props =>[id,brandname,brandimage];

}
