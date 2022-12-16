

import 'package:get/get.dart';
import 'package:shoping/app/networkInfo/AppPref.dart';
import 'package:shoping/domain/entites/userEntites.dart';
import 'package:shoping/presintation/Home/settingScreen/settingusecase.dart';
import 'package:shoping/presintation/login/loginscreen.dart';

class SettingController extends GetxController{
  final UserUseCase userUseCase;
  AppPreferences appPreferences = Get.find<AppPreferences>();
  SettingController(this.userUseCase);
  late UserEntites userEntites;
   var isloading=true;

  getUserData()async{
    isloading=true;
    update();
    final result =await userUseCase.execuiteUserData();
    result.fold((l) {
      Get.defaultDialog(title: "warning",middleText: l.message);
      update();
    },(r) {
      userEntites=r;
     // print("rr:${r}");
      update();
            });
    isloading=false;
    update();
  }
  logOut()async{
    await appPreferences.sharedPreferences.remove("token");
    Get.offAllNamed("/login");
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }
}