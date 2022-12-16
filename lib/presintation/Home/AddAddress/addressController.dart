
import 'package:get/get.dart';
import 'package:shoping/domain/requests/addAddressRequest.dart';
import 'package:shoping/presintation/Home/AddAddress/addressUseCase.dart';
import 'package:shoping/presintation/Home/payment/paymentBinding.dart';
import 'package:shoping/presintation/Home/payment/paymentScreen.dart';

class AddressController extends GetxController{
  final AddressUseCase _addressUseCase;
  var isloading=true;

  AddressController(this._addressUseCase);

  addAddressess(String place,String city,String phone,String street,
      String pstalcode,id)async{
//    isloading=true;
//    update();
    final result=await _addressUseCase.executeAddAddress(AddAddressRequest(
        place,
        city,
        phone,
        street,
        pstalcode
    ));
    result.fold((l) {
      Get.defaultDialog(title:"Warning",
          middleText: l.message);
      update();
    }, (r) {
      Get.snackbar("Success", r.message,
          duration: Duration(seconds: 1));
      Get.off(()=>PaymentScreen(id),binding: PaymentBinding());
      update();
    });
    //isloading=false;
    update();
  }
}