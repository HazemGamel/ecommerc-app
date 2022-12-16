
import 'package:dartz/dartz.dart';
import 'package:shoping/app/error/Failure.dart';
import 'package:shoping/domain/entites/BrandingEntites.dart';
import 'package:shoping/domain/entites/CategoriesEntites.dart';
import 'package:shoping/domain/entites/favoriteEntites.dart';
import 'package:shoping/domain/entites/productentites.dart';
import 'package:shoping/domain/repositry/BaseRepository.dart';

class HomeUseCase{
  final BaseRepository _BaseRepository;
 const HomeUseCase(this._BaseRepository);
  Future<Either<Failure,List<CategoriesEntities>>> executeCategories(){
    return _BaseRepository.getAllCategories();
  }

  Future<Either<Failure,List<BrandsEntities>>> executeBrands(){
    return _BaseRepository.getAllBrands();
  }
  Future<Either<Failure,List<ProductEntites>>> executeProducts(){
    return _BaseRepository.getAllProducts();
  }

  Future<Either<Failure,List<ProductEntites>>> executeGetUserFavorite()async{
    return _BaseRepository.getUserFavorite();
  }
}