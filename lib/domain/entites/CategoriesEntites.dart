import 'package:equatable/equatable.dart';

class CategoriesEntities extends Equatable{
  final String id;
  final String categoryname;
  final String categoryimage;

const  CategoriesEntities({
    required this.id,required this.categoryname,required this.categoryimage});

  @override
  // TODO: implement props
  List<Object?> get props =>[id,categoryname,categoryimage];

}

