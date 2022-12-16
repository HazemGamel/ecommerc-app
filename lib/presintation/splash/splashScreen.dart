
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/presintation/splash/controller.dart';
import '../../app/Resource/AppStrings.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/styles.dart';
import '../../app/Resource/Appcolors.dart';

class SplashScreen extends StatelessWidget {
 splashController controller = Get.put(splashController());
 // final v =Get.lazyPut(() => splashController());
  //final v = Get.find<splashController>();
  SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:   [
            Center(
              child: Text(AppStrings.splashWelcome,
                  style:getTextStyle(
                      color: AppColors.splashColor,
                      fontSize: FontSize.s30,fontweight: FontWeight.bold)),
            ),
            SizedBox(height: AppSize.s10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shop,color: AppColors.splashColor,size: FontSize.s30,),
                SizedBox(width: AppSize.s5,),
                Text(AppStrings.souk,style:
                getTextStyle(color: AppColors.splashColor,
                    fontSize: FontSize.s30),),
              ],
            ),
            SizedBox(height: AppSize.s5,),
            Text(AppStrings.world,style: getTextStyle(
                color: AppColors.splashColor,
                fontSize: FontSize.s12),),
          ],
        ),
      ),
    );
  }
}
