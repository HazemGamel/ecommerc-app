
import 'package:get/get.dart';
import 'package:shoping/presintation/restpassword/checkemailcontroller.dart';
import 'package:shoping/presintation/restpassword/codecontroller.dart';
import 'package:shoping/presintation/restpassword/newpasswordcontroller.dart';
import 'package:shoping/presintation/restpassword/usecase.dart';

class CheckEmailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CheckEmailController(Get.find<CheckEmailUseCase>()));
  }

}
class CheckCodeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CodeController(Get.find<CheckCodeUseCase>()));
  }

}

class RestPasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RestPasswordController(Get.find<RestPasswordUseCase>()));
  }

}
