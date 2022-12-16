
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:shoping/presintation/Home/maincontroller.dart';

class MainBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(),fenix: true);
  }

}