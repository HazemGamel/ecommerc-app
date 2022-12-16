import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shoping/app/error/arrayofmessageerror.dart';
import 'package:shoping/app/networkInfo/AppPref.dart';
import 'package:shoping/datalayer/models/AddAddressModel.dart';
import 'package:shoping/datalayer/models/AddProductToCartModel.dart';
import 'package:shoping/datalayer/models/BrandsModel.dart';
import 'package:shoping/datalayer/models/CartModel.dart';
import 'package:shoping/datalayer/models/CategoriesModel.dart';
import 'package:shoping/datalayer/models/ProductModel.dart';
import 'package:shoping/datalayer/models/SearchproductModel.dart';
import 'package:shoping/datalayer/models/favoriteModel.dart';
import 'package:shoping/datalayer/models/paymentModel.dart';
import 'package:shoping/datalayer/models/productDetailsModel.dart';
import 'package:shoping/datalayer/models/registerResponseModel.dart';
import 'package:shoping/datalayer/models/restpasswordmodel.dart';
import 'package:shoping/datalayer/models/usermodel.dart';
import 'package:shoping/domain/requests/addAddressRequest.dart';
import 'package:shoping/domain/requests/loginrequest.dart';
import 'package:shoping/domain/requests/restpasswordrequest.dart';
import '../../../app/constance/Appconstance.dart';
import 'package:shoping/app/error/Exceptions.dart';
import 'package:shoping/app/error/messageError.dart';
import 'package:shoping/app/networkInfo/internet_ckeck.dart';
import 'package:shoping/domain/requests/registerrequest.dart';

abstract class BaseDataSource {
  Future<RegisterResponseModel>  register(RegisterRequest registerRequest);
  Future<RegisterResponseModel>  login(LoginRequest loginRequest);
  Future<Unit>  sendEmailToResetPassword(EmailRequest emailRequest);
  Future<Unit>  sendCodeToResetPassword(CodeRequest codeRequest);
  Future<RestPasswordModel>
  sendEmailAndPassToResetPassword(NewPasswordRequest newPasswordRequest);
  Future<List<CategoriesModel>> getAllCategories();
  Future<List<BrandsModel>> getAllBrands();
  Future<List<ProductModel>> getAllProducts();
  Future<FavoriteModel> addProductToFavorite(String id);
  Future<FavoriteModel> removeProductToFavorite(id);
  Future<List<ProductModel>> getUserFavorite();
  Future<ProductDetailsModel> getProductDetails(id);
  Future<AddProductToCartModel> addProductToCart(id);
  Future<CartModel> getAllCart();
  Future<AddAddressModel> addAddress(AddAddressRequest addAddressRequest);
  Future<Unit> removeProductFromCart(id);
  Future<PaymentModel> paymentSession(id);
  Future<UserModel> getUserData();
  Future<List<SearchProductModel>> searchProduct(text);


}

class AuthDataSource extends BaseDataSource {
 final NetworkInfo networkInfo;
  AuthDataSource(this.networkInfo);
 AppPreferences appPreferences = Get.find<AppPreferences>();

  @override
  Future<RegisterResponseModel> register(
      RegisterRequest registerRequest) async {
    if(await networkInfo.isConnected) {
      try {
        final response =
        await Dio().post(AppConstance.REGISTERLINK, data: {
          "name": registerRequest.username,
          "email": registerRequest.email,
          "password": registerRequest.password,
          "passwordConfirm": registerRequest.confirmpassword,
        },
            options: Options(headers: {AppConstance.contentType:AppConstance.applicationJson}));
        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.data);
          return RegisterResponseModel.fromjson(response.data);
        }
      } catch (r) {
        if(r is DioError){
          throw ArrayOfErrorsException(ArrayOfErrors.fromJson(r.response!.data));
        }
      }
    }
    throw OfflineException();
  }
  @override
  Future<RegisterResponseModel> login(LoginRequest loginRequest)async {
    if(await networkInfo.isConnected){
      try {
      final response = await Dio(BaseOptions(
        receiveDataWhenStatusError: true,
      )).post(AppConstance.LOGINLINK, data: {
        "email": loginRequest.email,
        "password": loginRequest.password,
      },
          options: Options(headers: {
            AppConstance.contentType: AppConstance.applicationJson
          }));
        if (response.statusCode == 200 || response.statusCode == 201) {
          return RegisterResponseModel.fromjson(response.data);
        }
      }catch (r) {
        if(r is DioError){
          throw ServerException(ErrorModel.fromJson(r.response!.data));
        }
       // throw ServerException();
    }
       }
    throw OfflineException();
  }

  @override
  Future<Unit>
  sendEmailToResetPassword(EmailRequest emailRequest) async{
      if(await networkInfo.isConnected){
        try{
          final response = await Dio().post(AppConstance.CHECKEMAIL,data: {
            "email":emailRequest.email
          },options:Options(headers: {
            AppConstance.contentType: AppConstance.applicationJson
          }));
          if(response.statusCode==200||response.statusCode==201){
            return Future.value(unit);
          }
        }catch (err){
          if(err is DioError){
            throw ServerException(ErrorModel.fromJson(err.response!.data));
          }
        }
      }
        throw OfflineException();
      }

  @override
  Future<Unit> sendCodeToResetPassword(CodeRequest codeRequest) async{
    if(await networkInfo.isConnected){
      try{
        final response = await Dio().post(AppConstance.VERIFYCODE,data: {
          "restCode":codeRequest.code
        },options:Options(headers: {
          AppConstance.contentType: AppConstance.applicationJson
        }));
        if(response.statusCode==200||response.statusCode==201){
          return Future.value(unit);
        }
      }catch (err){
        if(err is DioError){
          throw ServerException(ErrorModel.fromJson(err.response!.data));
        }
      }
    }
    throw OfflineException();
  }

  @override
  Future<RestPasswordModel>
  sendEmailAndPassToResetPassword(NewPasswordRequest newPasswordRequest)async {
    if(await networkInfo.isConnected){
      try{
        final response = await Dio().put(AppConstance.RESTPASSWORD,data: {
          "email":newPasswordRequest.email,
          "newPassword":newPasswordRequest.newpassword,
        },
            options:Options(headers: {
          AppConstance.contentType: AppConstance.applicationJson
        }));
        if(response.statusCode==200||response.statusCode==201){
          return RestPasswordModel.fromJson(response.data);
        }
      }catch (err){
        if(err is DioError){
          throw ServerException(ErrorModel.fromJson(err.response!.data));
        }
      }
    }
    throw OfflineException();
  }

  @override
  Future<List<CategoriesModel>> getAllCategories() async{
   if(await networkInfo.isConnected){
     try{
       final response = await Dio().get(AppConstance.GetCategories,
           options:Options(headers: {
         AppConstance.contentType: AppConstance.applicationJson,
             "Authorization": "Bearer ${appPreferences.sharedPreferences.get("token")}",
       }));
       if(response.statusCode==200||response.statusCode==201){
         return List<CategoriesModel>.from((response.data["data"]as List )
             .map((e) => CategoriesModel.fromJson(e)) );
         //return CategoriesModel.fromJson(response.data);
       }
     }catch (err){
       if(err is DioError){
         throw ServerException(ErrorModel.fromJson(err.response!.data));
       }
     }
   }
   throw OfflineException();
  }

  @override
  Future<List<BrandsModel>> getAllBrands() async{
    if(await networkInfo.isConnected){
      try{
        final response = await Dio().get(AppConstance.GetBrands,
            options:Options(headers: {
              AppConstance.contentType: AppConstance.applicationJson,
              "Authorization": "Bearer ${appPreferences.sharedPreferences.get("token")}",
            }));
        if(response.statusCode==200||response.statusCode==201){
          return List<BrandsModel>.from((response.data["data"]as List )
              .map((e) => BrandsModel.fromJson(e)) );
          //return CategoriesModel.fromJson(response.data);
        }
      }catch (err){
        if(err is DioError){
          throw ServerException(ErrorModel.fromJson(err.response!.data));
        }
      }
    }
    throw OfflineException();
  }

  @override
  Future<List<ProductModel>> getAllProducts() async{
    if(await networkInfo.isConnected){
      try{
        final response = await Dio().get(AppConstance.GetProducts,
            options:Options(headers: {
              AppConstance.contentType: AppConstance.applicationJson,
              "Authorization": "Bearer ${appPreferences.sharedPreferences.get("token")}",
            }));
        if(response.statusCode==200||response.statusCode==201){
          //print(response.data["data"]);
          return List<ProductModel>.from((response.data["data"]as List )
              .map((e) => ProductModel.fromJson(e)) );
          //return CategoriesModel.fromJson(response.data);
        }
      }catch (err){
        if(err is DioError){
          throw ServerException(ErrorModel.fromJson(err.response!.data));
        }
      }
    }
    throw OfflineException();
  }

  @override
  Future<FavoriteModel> addProductToFavorite(String id) async{
    if(await networkInfo.isConnected){
      try{
        final response = await Dio().post(AppConstance.AddProductToFav,data: {
          "productId": id,
        },
            options:Options(headers: {
              AppConstance.contentType: AppConstance.applicationJson,
              "Authorization": "Bearer ${appPreferences.sharedPreferences.get("token")}",
            }));
        if(response.statusCode==200||response.statusCode==201){
          return FavoriteModel.fromJson(response.data);
        }
      }catch (err){
        if(err is DioError){
          throw ServerException(ErrorModel.fromJson(err.response!.data));
        }
      }
    }
    throw OfflineException();
  }

  @override
  Future<List<ProductModel>> getUserFavorite()async {
    if(await networkInfo.isConnected){
      try{
        final response = await Dio().get(AppConstance.GetWishlist,
            options:Options(headers: {
              AppConstance.contentType: AppConstance.applicationJson,
              "Authorization": "Bearer ${appPreferences.sharedPreferences.get("token")}",
            }));
        if(response.statusCode==200||response.statusCode==201){
         // print(response.data["data"]);
          return List<ProductModel>.from((response.data["data"]as List )
              .map((e) => ProductModel.fromJson(e)) );
          //return CategoriesModel.fromJson(response.data);
        }
      }catch (err){
        if(err is DioError){
          throw ServerException(ErrorModel.fromJson(err.response!.data));
        }
      }
    }
    throw OfflineException();
  }

  @override
  Future<FavoriteModel> removeProductToFavorite( id) async{
    if(await networkInfo.isConnected){
      try{
        final response = await Dio().delete(AppConstance.RemovefromFav(id),
            options:Options(headers: {
              AppConstance.contentType: AppConstance.applicationJson,
              "Authorization": "Bearer ${appPreferences.sharedPreferences.get("token")}",
            }));
        if(response.statusCode==200||response.statusCode==201){
          return FavoriteModel.fromJson(response.data);
        }
      }catch (err){
        if(err is DioError){
          throw ServerException(ErrorModel.fromJson(err.response!.data));
        }
      }
    }
    throw OfflineException();
  }

  @override
  Future<ProductDetailsModel> getProductDetails(id) async{
    if(await networkInfo.isConnected){
      try{
        final response = await Dio().get(AppConstance.GetProductDetails(id),
            options:Options(headers: {
              AppConstance.contentType: AppConstance.applicationJson,
              "Authorization": "Bearer ${appPreferences.sharedPreferences.get("token")}",
            }));
        if(response.statusCode==200||response.statusCode==201){
         // print("res:${response.data["data"]}");
          return ProductDetailsModel.fromJson(response.data["data"]);
        }
      }catch (err){
        if(err is DioError){
          throw ServerException(ErrorModel.fromJson(err.response!.data));
        }
      }
    }
    throw OfflineException();
  }

  @override
  Future<AddProductToCartModel> addProductToCart(id)async {
    if(await networkInfo.isConnected){
      try{
        final response = await Dio().post(AppConstance.AddProductToCart,data: {
          "productId": id,
        },
            options:Options(headers: {
              AppConstance.contentType: AppConstance.applicationJson,
              "Authorization": "Bearer ${appPreferences.sharedPreferences.get("token")}",
            }));
        if(response.statusCode==200||response.statusCode==201){
          return AddProductToCartModel.fromJson(response.data);
        }
      }catch (err){
        if(err is DioError){
          throw ServerException(ErrorModel.fromJson(err.response!.data));
        }
      }
    }
    throw OfflineException();
  }

  @override
  Future<CartModel> getAllCart()async {
    if(await networkInfo.isConnected){
      try{
        final response = await Dio().get(AppConstance.GetallCart,
            options:Options(headers: {
              AppConstance.contentType: AppConstance.applicationJson,
              "Authorization": "Bearer ${appPreferences.sharedPreferences.get("token")}",
            }));
        if(response.statusCode==200||response.statusCode==201){
          print("res:${response.data}");
          return CartModel.fromJson(response.data["items"]);
        }
      }catch (err){
        if(err is DioError){
          throw ServerException(ErrorModel.fromJson(err.response!.data));
        }
      }
    }
    throw OfflineException();
  }

  @override
  Future<AddAddressModel> addAddress(AddAddressRequest addAddressRequest) async{
    if(await networkInfo.isConnected){
      try{
        final response = await Dio().post(AppConstance.Address,data: {
          "alias":addAddressRequest.place,
          "details":addAddressRequest.street,
          "phone":addAddressRequest.phone,
          "city":addAddressRequest.city,
          "postalCode":addAddressRequest.pstalcode,
        },
            options:Options(headers: {
              AppConstance.contentType: AppConstance.applicationJson,
              "Authorization": "Bearer ${appPreferences.sharedPreferences.get("token")}",
            }));
        if(response.statusCode==200||response.statusCode==201){
          print("res:${response.data}");
          return AddAddressModel.fromJson(response.data);
        }
      }catch (err){
        if(err is DioError){
          throw ServerException(ErrorModel.fromJson(err.response!.data));
        }
      }
    }
    throw OfflineException();
  }

  @override
  Future<Unit> removeProductFromCart(id) async{
    if(await networkInfo.isConnected){
      try{
        final response = await Dio().delete(AppConstance.Removefromcart(id),
            options:Options(headers: {
              AppConstance.contentType: AppConstance.applicationJson,
              "Authorization": "Bearer ${appPreferences.sharedPreferences.get("token")}",
            }));
        if(response.statusCode==200||response.statusCode==201){
          return Future.value(unit);
        }
      }catch (err){
        if(err is DioError){
          throw ServerException(ErrorModel.fromJson(err.response!.data));
        }
      }
    }
    throw OfflineException();
  }

  @override
  Future<PaymentModel> paymentSession(id) async{
    if(await networkInfo.isConnected){
      try{
        final response = await Dio().post(AppConstance.paymentUrl(id),
            options:Options(headers: {
              AppConstance.contentType: AppConstance.applicationJson,
              "Authorization": "Bearer ${appPreferences.sharedPreferences.get("token")}",
            }));
        if(response.statusCode==200||response.statusCode==201){
          return PaymentModel.fromJson(response.data["session"]);
        }
      }catch (err){
        if(err is DioError){
          throw ServerException(ErrorModel.fromJson(err.response!.data));
        }
      }
    }
    throw OfflineException();
  }

  @override
  Future<UserModel> getUserData() async{
    if(await networkInfo.isConnected){
      try{
        final response = await Dio().get(AppConstance.userData,
            options:Options(headers: {
              AppConstance.contentType: AppConstance.applicationJson,
              "Authorization": "Bearer ${appPreferences.sharedPreferences.
              get("token")}",
            }));
        if(response.statusCode==200||response.statusCode==201){
          return UserModel.fromJson(response.data["data"]);
        }
      }catch (err){
        if(err is DioError){
          throw ServerException(ErrorModel.fromJson(err.response!.data));
        }
      }
    }
    throw OfflineException();
  }

  @override
  Future<List<SearchProductModel>> searchProduct(text)async {
    if(await networkInfo.isConnected){
      try{
        final response = await Dio().get(AppConstance.Search(text),
            options:Options(headers: {
              AppConstance.contentType: AppConstance.applicationJson,
              "Authorization": "Bearer ${appPreferences.sharedPreferences.
              get("token")}",
            }));
        if(response.statusCode==200||response.statusCode==201){
          //print("search res:${response.data}");
          return List<SearchProductModel>.from((response.data["data"] as List)
              .map((e) => SearchProductModel.fromJson(e)));
          //return SearchProductModel.fromJson(response.data["data"]);
        }
      }catch (err){
        if(err is DioError){
          throw ServerException(ErrorModel.fromJson(err.response!.data));
        }
      }
    }
    throw OfflineException();
  }
  }
