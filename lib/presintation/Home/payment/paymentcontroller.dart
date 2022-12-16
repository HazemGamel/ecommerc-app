
import 'package:get/get.dart';
import 'package:shoping/presintation/Home/payment/paymentUseCase.dart';
import 'package:shoping/presintation/Home/payment/webViewScreen.dart';

class PaymentController extends GetxController{
  final PaymentUseCase _paymentUseCase;

  PaymentController(this._paymentUseCase);

  paymentSession(id)async{
    final result=await _paymentUseCase.exexutepayment(id);
    result.fold((l) {
      Get.defaultDialog(title:"Warning",
          middleText: l.message);
      update();
    }, (r) {
     // print("session:${r.paymentUrl}");
      Get.off(()=>WebViewScreen(r.paymentUrl));
    });
    update();
  }
}