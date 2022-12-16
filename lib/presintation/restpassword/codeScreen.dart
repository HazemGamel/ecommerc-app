import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/AppStrings.dart';
import 'package:shoping/app/Resource/Appcolors.dart';
import 'package:shoping/app/Resource/styles.dart';
import 'package:shoping/presintation/restpassword/codecontroller.dart';

class VerifyCodeScreen extends GetView<CodeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppSize.s50,),
            Text(AppStrings.veryficationCode,
              style: getTextStyle(color: AppColors.gray,
                  fontSize: FontSize.s20,fontweight: FontWeight.bold),),
            const SizedBox(height: AppSize.s20,),
            Text(AppStrings.checkCode,
              style: getTextStyle(color: AppColors.black,
                  fontSize: FontSize.s30,fontweight: FontWeight.bold),),
            const SizedBox(height: AppSize.s12,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(AppStrings.pleaseEnterCode,
                style: getTextStyle(color: AppColors.gray,
                    fontSize: FontSize.s15),),
            ),
            GetBuilder<CodeController>(
                builder: (controller)=> OtpTextField(
                  numberOfFields: 6,
                  borderColor: Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode){
                  controller.checkCode(verificationCode);
                  }, // end onSubmit
                ),)

          ],
        ),
      ),
    );
  }
}
