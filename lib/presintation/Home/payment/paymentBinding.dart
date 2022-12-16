
import 'package:get/get.dart';
import 'package:shoping/presintation/Home/payment/paymentUseCase.dart';
import 'package:shoping/presintation/Home/payment/paymentcontroller.dart';

class PaymentBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController(Get.find<PaymentUseCase>()));
  }

}