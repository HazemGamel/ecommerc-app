import 'package:dartz/dartz.dart';
import 'package:shoping/app/error/Failure.dart';
import 'package:shoping/domain/entites/favoriteEntites.dart';
import 'package:shoping/domain/entites/productentites.dart';
import 'package:shoping/domain/repositry/BaseRepository.dart';

class FavoriteUseCase {
  final BaseRepository _baseRepository ;
  FavoriteUseCase(this._baseRepository);

  Future<Either<Failure,FavoriteEntites>> executeAddProduct(String id)async{
    return _baseRepository.addProductToFavorite(id);
  }

  Future<Either<Failure,List<ProductEntites>>> executeGetUserFavorite()async{
    return _baseRepository.getUserFavorite();
  }

  Future<Either<Failure,FavoriteEntites>> executeRemoveProduct(id)async{
    return _baseRepository.removeProductToFavorite(id);
  }
}