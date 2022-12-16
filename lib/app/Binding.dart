
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoping/app/networkInfo/AppPref.dart';
import 'package:shoping/app/networkInfo/internet_ckeck.dart';
import 'package:shoping/datalayer/dataresource/remote/DataSource.dart';
import 'package:shoping/datalayer/repositryimp/RepossitoryImp.dart';
import 'package:shoping/domain/repositry/BaseRepository.dart';
import 'package:shoping/presintation/Home/AddAddress/addressUseCase.dart';
import 'package:shoping/presintation/Home/CardScreen/cartusecase.dart';
import 'package:shoping/presintation/Home/HomeScreen/HomeUseCase.dart';
import 'package:shoping/presintation/Home/favoriteScreen/FavoritUseCase.dart';
import 'package:shoping/presintation/Home/payment/paymentUseCase.dart';
import 'package:shoping/presintation/Home/productDetails/ProductDetailsUseCase.dart';
import 'package:shoping/presintation/Home/search/searchusecase.dart';
import 'package:shoping/presintation/Home/settingScreen/settingusecase.dart';
import 'package:shoping/presintation/login/usecase.dart';
import 'package:shoping/presintation/register/registercontroller.dart';
import 'package:shoping/presintation/register/usecases.dart';
import 'package:shoping/presintation/restpassword/usecase.dart';
import 'package:shoping/presintation/splash/controller.dart';

 initial()async{
   await Get.putAsync(() => AppPreferences().init());
   Get.put<InternetConnectionChecker>(InternetConnectionChecker());
   //network
   Get.put<NetworkInfo>(NetworkInfoImpl(Get.find<InternetConnectionChecker>()));
}

  initalBindings(){
//auth
   Get.lazyPut<BaseDataSource>(() =>
   (AuthDataSource(Get.find<NetworkInfo>())),fenix: true);
   //usecases
   Get.lazyPut(()  =>  RegisterUseCase(Get.find<BaseRepository>()),fenix: true);
   Get.lazyPut(() =>  LoginUseCase(Get.find<BaseRepository>()),fenix: true);
   Get.lazyPut(() =>  CheckEmailUseCase(Get.find<BaseRepository>()),fenix: true);
   Get.lazyPut(() =>  CheckCodeUseCase(Get.find<BaseRepository>()),fenix: true);
   Get.lazyPut(() =>  RestPasswordUseCase(Get.find<BaseRepository>()),fenix: true);
   Get.lazyPut(() =>  HomeUseCase(Get.find<BaseRepository>()),fenix: true);
   Get.lazyPut(() =>  FavoriteUseCase(Get.find<BaseRepository>()),fenix: true);
   Get.lazyPut(() =>  ProductDetailsUseCase(Get.find<BaseRepository>()),fenix: true);
   Get.lazyPut(() =>  CartUseCase(Get.find<BaseRepository>()),fenix: true);
   Get.lazyPut(() =>  AddressUseCase(Get.find<BaseRepository>()),fenix: true);
   Get.lazyPut(() =>  PaymentUseCase(Get.find<BaseRepository>()),fenix: true);
   Get.lazyPut(() =>  UserUseCase(Get.find<BaseRepository>()),fenix: true);
   Get.lazyPut(() =>  SearchUseCase(Get.find<BaseRepository>()),fenix: true);
   Get.lazyPut<BaseRepository>
       (() =>( RepositoryImp(Get.find<BaseDataSource>())),fenix: true);



}