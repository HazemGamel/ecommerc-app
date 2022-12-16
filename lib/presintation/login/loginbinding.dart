import 'package:get/get.dart';
import 'package:shoping/app/networkInfo/AppPref.dart';
import 'package:shoping/presintation/login/logincontroller.dart';
import 'package:shoping/presintation/login/usecase.dart';

class LoginBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(Get.find<LoginUseCase>()),fenix: true);
  }

}