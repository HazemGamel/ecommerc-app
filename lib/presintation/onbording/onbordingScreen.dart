import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/AppStrings.dart';
import 'package:shoping/app/Resource/Appcolors.dart';
import 'package:shoping/app/Resource/styles.dart';
import '../../datalayer/dataresource/local/staticdata.dart';
import 'package:shoping/presintation/onbording/controller.dart';
import 'package:shoping/presintation/widgets/onbordingPageView.dart';

class OnbordingScreen extends GetView<onbordingController> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: CustomPageView(),
            ),
            Expanded(
              flex: 1,
                child: Column(
              children: [
               GetBuilder<onbordingController>(builder: (controller)=> Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   ...List.generate(onbordingpage.length,
                           (index)=>
                           AnimatedContainer(
                             margin: const EdgeInsets.only(right: 4,top: 20),
                             duration: const Duration(milliseconds: 400),
                             height: AppSize.s10,
                             width: AppSize.s10,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 color:controller.currentpage == index? AppColors.orange:
                                 AppColors.blue
                             ),
                           )),
                 ],
               ),),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                      color: Colors.teal,
                      onPressed: (){
                      Get.offNamed("/register");
                      },
                  child: Text(AppStrings.skip,style:
                  getTextStyle(color: AppColors.wight,
                      fontSize: FontSize.s12,
                  fontweight: FontWeight.bold),),),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
