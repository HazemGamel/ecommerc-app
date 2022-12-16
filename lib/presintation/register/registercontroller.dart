import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping/app/constance/statusRequest.dart';
import 'package:shoping/app/error/Apperrorsmessages.dart';
import 'package:shoping/app/error/Failure.dart';
import 'package:shoping/app/networkInfo/AppPref.dart';
import 'package:shoping/datalayer/models/registerResponseModel.dart';
import 'package:shoping/domain/requests/registerrequest.dart';
import 'package:shoping/presintation/register/usecases.dart';

class RegisterController extends GetxController{
  final RegisterUseCase registerUseCase;
  AppPreferences appPreferences = Get.find<AppPreferences>();

  StatesRequest? statesRequest ;

  RegisterController(this.registerUseCase);
  String? tokenn;
Future<void>  register(String username,String email,
      String password,String confirmpassword)async{
      statesRequest=StatesRequest.loading;
      update();
        var result =await registerUseCase.execute(RegisterRequest(
            username: username,
            email: email,
            password: password,
            confirmpassword: confirmpassword));
        result.fold((l) {
         Get.defaultDialog(title:"Warning",
             middleText: l.message);
         update();
        }, (r) async{
          await appPreferences.sharedPreferences.setString("token", r.token!);
          update();

          Get.offNamed("/mainscreen");
        });
        statesRequest =StatesRequest.success;
      update();
  }



}

