
import 'package:get/get.dart';
import 'package:shoping/presintation/onbording/controller.dart';

class onbordingBinding extends Bindings{
  @override
  void dependencies() {
    print("onbording");
    //Get.put(onbordingController());
    Get.lazyPut(() => onbordingController());
  }

}