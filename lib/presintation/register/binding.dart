import 'package:get/get.dart';
import 'package:shoping/app/networkInfo/AppPref.dart';
import 'package:shoping/app/networkInfo/internet_ckeck.dart';
import 'package:shoping/datalayer/dataresource/remote/DataSource.dart';
import 'package:shoping/datalayer/repositryimp/RepossitoryImp.dart';
import 'package:shoping/domain/repositry/BaseRepository.dart';
import 'package:shoping/presintation/register/registercontroller.dart';
import 'package:shoping/presintation/register/usecases.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(Get.find<RegisterUseCase>()),fenix: true);
  }

}