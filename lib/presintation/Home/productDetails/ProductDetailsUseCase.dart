
import 'package:dartz/dartz.dart';
import 'package:shoping/app/error/Failure.dart';
import 'package:shoping/domain/entites/ProductDetailsEntites.dart';
import 'package:shoping/domain/repositry/BaseRepository.dart';

class ProductDetailsUseCase{
  final BaseRepository _baseRepository;

  ProductDetailsUseCase(this._baseRepository);

  Future<Either<Failure,ProductDetailsEntites>> executeProductDetails(id)async{
    return _baseRepository.getProductDetails(id);
  }

}