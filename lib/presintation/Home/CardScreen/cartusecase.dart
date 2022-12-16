

import 'package:dartz/dartz.dart';
import 'package:shoping/app/error/Failure.dart';
import 'package:shoping/domain/entites/AddProductToCartEntites.dart';
import 'package:shoping/domain/entites/CartEntites.dart';
import 'package:shoping/domain/repositry/BaseRepository.dart';

class CartUseCase{
  final BaseRepository _baseRepository;
  CartUseCase(this._baseRepository);
  Future<Either<Failure,AddProductToCartEntites>> exexutAddProductToCart(id)async{
    return _baseRepository.addProductToCart(id);
  }

  Future<Either<Failure,CartEntites>> exeuteGetAllCart()async{
    return _baseRepository.getUserCart();
  }

  Future<Either<Failure,Unit>> exeuteRemoveFromCart(id)async{
    return _baseRepository.removeProductFromCart(id);
  }
}