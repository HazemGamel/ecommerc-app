import 'package:dartz/dartz.dart';
import 'package:shoping/app/error/Exceptions.dart';
import 'package:shoping/app/error/Failure.dart';
import 'package:shoping/domain/entites/AddProductToCartEntites.dart';
import 'package:shoping/domain/entites/BrandingEntites.dart';
import 'package:shoping/domain/entites/CartEntites.dart';
import 'package:shoping/domain/entites/CategoriesEntites.dart';
import 'package:shoping/domain/entites/ProductDetailsEntites.dart';
import 'package:shoping/domain/entites/SearchProductEntites.dart';
import 'package:shoping/domain/entites/addAddressEntites.dart';
import 'package:shoping/domain/entites/favoriteEntites.dart';
import 'package:shoping/domain/entites/paymentEntites.dart';
import 'package:shoping/domain/entites/productentites.dart';
import 'package:shoping/domain/entites/registerresponseentites.dart';
import 'package:shoping/domain/entites/restpasswordentites.dart';
import 'package:shoping/domain/entites/userEntites.dart';
import 'package:shoping/domain/requests/addAddressRequest.dart';
import 'package:shoping/domain/requests/loginrequest.dart';
import 'package:shoping/domain/requests/registerrequest.dart';
import 'package:shoping/domain/requests/restpasswordrequest.dart';

abstract class BaseRepository {
  Future<Either<Failure,RegisterResponseEntity>> register(RegisterRequest registerRequest);
  Future<Either<Failure,RegisterResponseEntity>> login(LoginRequest loginRequest);
  Future<Either<Failure,Unit>>
  sendEmailToRestPassword(EmailRequest emailRequest);
  Future<Either<Failure,Unit>>
  sendCodeToRestPassword(CodeRequest codeRequest);
  Future<Either<Failure,ResetPasswordEntities>>
  sendEmailAndNewPassToRestPassword(NewPasswordRequest newPasswordRequest);
  Future<Either<Failure,List<CategoriesEntities>>> getAllCategories();
  Future<Either<Failure,List<BrandsEntities>>> getAllBrands();
  Future<Either<Failure,List<ProductEntites>>> getAllProducts();
  Future<Either<Failure,FavoriteEntites>> addProductToFavorite(String id);
  Future<Either<Failure,FavoriteEntites>> removeProductToFavorite( id);
  Future<Either<Failure,List<ProductEntites>>> getUserFavorite();
  Future<Either<Failure,ProductDetailsEntites>> getProductDetails(id);
  Future<Either<Failure,AddProductToCartEntites>> addProductToCart(String id);
  Future<Either<Failure,CartEntites>> getUserCart();
  Future<Either<Failure,AddAddressEntites>>
  addAddress(AddAddressRequest addAddressRequest);
  Future<Either<Failure,Unit>> removeProductFromCart(id);
  Future<Either<Failure,PaymentEntites>> paymentSession(id);
  Future<Either<Failure,UserEntites>> getUserData();
  Future<Either<Failure,List<SearchProductEntites>>> searchProducts(text);


}