import 'package:get/get.dart';
import 'package:shoping/app/networkInfo/AppPref.dart';

class onbordingController extends GetxController{
   int currentpage = 0;
  AppPreferences appPreferences = Get.find<AppPreferences>();
  @override
  void onInit() {
    appPreferences.sharedPreferences.setBool("onbording", true);
    super.onInit();
  }

  void changecurrentpage(int index){
    currentpage=index;
    update();
  }
}