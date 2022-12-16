

// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:shoping/app/error/Apperrorsmessages.dart';
import 'package:shoping/app/error/Exceptions.dart';
import 'package:shoping/app/error/Failure.dart';
import 'package:shoping/app/error/messageError.dart';
import 'package:shoping/app/networkInfo/AppPref.dart';
import 'package:shoping/datalayer/dataresource/remote/DataSource.dart';
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
import 'package:shoping/domain/repositry/BaseRepository.dart';
import 'package:shoping/domain/requests/addAddressRequest.dart';
import 'package:shoping/domain/requests/loginrequest.dart';
import 'package:shoping/domain/requests/registerrequest.dart';
import 'package:shoping/domain/requests/restpasswordrequest.dart';

class RepositoryImp extends BaseRepository{
  final BaseDataSource baseDataSource;

  RepositoryImp(this.baseDataSource);

  @override
  Future<Either<Failure,RegisterResponseEntity>>
  register(RegisterRequest registerRequest)async {
    try{
    final result =  await baseDataSource.register(registerRequest);
    return Right(result);
    } on ArrayOfErrorsException catch(failure) {
    return Left(ArrayOfErrorsFailure(AppErrorMessages.emailExist));
    }on OfflineException {
      return Left(offlineFailure(AppErrorMessages.offline));
    }
  }

  @override
  Future<Either<Failure, RegisterResponseEntity>>
  login(LoginRequest loginRequest)async {
    try{
    final result = await baseDataSource.login(loginRequest);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException  {
      return Left(offlineFailure(AppErrorMessages.offline));
    }
  }

  @override
  Future<Either<Failure, Unit>>
  sendEmailToRestPassword(EmailRequest emailRequest)async {
    try {
      final result = await baseDataSource.sendEmailToResetPassword(
          emailRequest);
      return Right(result);
    }on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException {
      return Left(offlineFailure(AppErrorMessages.offline));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendCodeToRestPassword(CodeRequest codeRequest) async{
    try {
      final result = await baseDataSource.sendCodeToResetPassword(
          codeRequest);
      return Right(result);
    }on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException {
      return Left(offlineFailure(AppErrorMessages.offline));
    }
  }

  @override
  Future<Either<Failure, ResetPasswordEntities>>
  sendEmailAndNewPassToRestPassword(NewPasswordRequest newPasswordRequest) async{
    try {
      final result = await baseDataSource.
      sendEmailAndPassToResetPassword(newPasswordRequest);
      return Right(result);
    }on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException {
      return Left(offlineFailure(AppErrorMessages.offline));
    }
  }

  @override
  Future<Either<Failure,List< CategoriesEntities>>> getAllCategories()async {
    try{
      final result = await baseDataSource.getAllCategories();
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException{
      return Left(offlineFailure(AppErrorMessages.offline));

    }
  }

  @override
  Future<Either<Failure, List<BrandsEntities>>> getAllBrands() async{
    try{
      final result = await baseDataSource.getAllBrands();
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException{
      return Left(offlineFailure(AppErrorMessages.offline));

    }
  }

  @override
  Future<Either<Failure, List<ProductEntites>>> getAllProducts()async {
    try{
      final result = await baseDataSource.getAllProducts();
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException{
      return Left(offlineFailure(AppErrorMessages.offline));

    }
  }

  @override
  Future<Either<Failure, FavoriteEntites>> addProductToFavorite(String id)async {
    try{
      final result = await baseDataSource.addProductToFavorite(id);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException{
      return Left(offlineFailure(AppErrorMessages.offline));

    }
  }

  @override
  Future<Either<Failure, List<ProductEntites>>> getUserFavorite()async {
    try{
      final result = await baseDataSource.getUserFavorite();
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException{
      return Left(offlineFailure(AppErrorMessages.offline));

    }
  }

  @override
  Future<Either<Failure, FavoriteEntites>> removeProductToFavorite( id) async {
    try{
      final result = await baseDataSource.removeProductToFavorite(id);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException{
      return Left(offlineFailure(AppErrorMessages.offline));

    }

  }

  @override
  Future<Either<Failure, ProductDetailsEntites>> getProductDetails(id)async {
    try{
      final result = await baseDataSource.getProductDetails(id);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException{
      return Left(offlineFailure(AppErrorMessages.offline));

    }
  }

  @override
  Future<Either<Failure, AddProductToCartEntites>> addProductToCart(String id)async {
    try{
      final result = await baseDataSource.addProductToCart(id);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException{
      return Left(offlineFailure(AppErrorMessages.offline));

    }
  }

  @override
  Future<Either<Failure, CartEntites>> getUserCart()async {
    try{
      final result = await baseDataSource.getAllCart();
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException{
      return Left(offlineFailure(AppErrorMessages.offline));

    }
  }

  @override
  Future<Either<Failure, AddAddressEntites>>
  addAddress(AddAddressRequest addAddressRequest)async {
    try{
      final result = await baseDataSource.addAddress(addAddressRequest);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException{
      return Left(offlineFailure(AppErrorMessages.offline));

    }
  }

  @override
  Future<Either<Failure, Unit>> removeProductFromCart(id)async {
    try{
      final result = await baseDataSource.removeProductFromCart(id);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException{
      return Left(offlineFailure(AppErrorMessages.offline));

    }
  }

  @override
  Future<Either<Failure, PaymentEntites>> paymentSession(id) async{
    try{
      final result = await baseDataSource.paymentSession(id);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException{
      return Left(offlineFailure(AppErrorMessages.offline));

    }
  }

  @override
  Future<Either<Failure, UserEntites>> getUserData()async {
    try{
      final result = await baseDataSource.getUserData();
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException{
      return Left(offlineFailure(AppErrorMessages.offline));

    }
  }

  @override
  Future<Either<Failure,List<SearchProductEntites>>> searchProducts(text) async{
    try{
      final result = await baseDataSource.searchProduct(text);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorModel.message));
    }on OfflineException{
      return Left(offlineFailure(AppErrorMessages.offline));

    }
  }
  
}