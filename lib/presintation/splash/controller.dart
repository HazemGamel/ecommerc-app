import 'dart:async';

import 'package:get/get.dart';
import 'package:shoping/app/networkInfo/AppPref.dart';

class splashController extends GetxController{
  Timer? _timer;
  AppPreferences appPreferences =Get.find<AppPreferences>();
 void delay(){
    _timer= Timer(const Duration(seconds: 2),
            ()=>goTo());
  }

   goTo(){
   if( appPreferences.sharedPreferences.getBool("onbording")==true){
     if( appPreferences.sharedPreferences.getString("token")!=null){
       Get.offNamed("/mainscreen");
     }else{
       Get.offNamed("/register");
     }
   }else {
     Get.offNamed("/onbording");
   }
  }
  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
    delay();

  }
 // @override
//  void dispose() {
//    _timer?.cancel();
//    super.dispose();
//  }
  @override
  void onClose() {
_timer?.cancel();
super.onClose();
  }
}