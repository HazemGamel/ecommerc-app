import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping/app/constance/statusRequest.dart';
import 'package:shoping/app/error/Apperrorsmessages.dart';
import 'package:shoping/app/error/Failure.dart';
import 'package:shoping/app/error/messageError.dart';
import 'package:shoping/app/networkInfo/AppPref.dart';
import 'package:shoping/domain/requests/loginrequest.dart';
import 'package:shoping/domain/requests/registerrequest.dart';
import 'package:shoping/presintation/login/usecase.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;
  AppPreferences appPreferences = Get.find<AppPreferences>();
  LoginController(this._loginUseCase);
  StatesRequest? statesRequest;

  Future<void> Login(String email, String password) async {
    statesRequest = StatesRequest.loading;
    update();
    final result = await _loginUseCase.execute(LoginRequest(
        email: email,
        password: password));
    result.fold((l) {
      Get.defaultDialog(title: "warning", middleText: l.message);
      update();
    }, (r) async{
      await appPreferences.sharedPreferences.setString("token", r.token!);
      Get.offNamed("/mainscreen");
     update();
    });
    statesRequest = StatesRequest.error;
  update();
  }

}