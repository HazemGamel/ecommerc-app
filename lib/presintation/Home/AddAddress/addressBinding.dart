

import 'package:get/get.dart';
import 'package:shoping/presintation/Home/AddAddress/addressController.dart';
import 'package:shoping/presintation/Home/AddAddress/addressUseCase.dart';

class AddressessBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddressController(Get.find<AddressUseCase>()));
  }

}