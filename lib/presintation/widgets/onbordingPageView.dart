import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/Appcolors.dart';
import 'package:shoping/app/Resource/styles.dart';
import '../../datalayer/dataresource/local/staticdata.dart';
import 'package:shoping/presintation/onbording/controller.dart';

class CustomPageView extends GetView<onbordingController> {

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (val){
        controller.changecurrentpage(val);
      },
      itemCount: onbordingpage.length,
      itemBuilder: (context,index)=>Column(
        children: [
          Text(onbordingpage[index].title,style:
          getTextStyle(color: AppColors.black,
              fontSize: FontSize.s30,
              fontweight: FontWeight.bold),),
          SizedBox(height: AppSize.s50,),
          Container(
              width: AppSize.s250,
              color: Colors.grey,
              child: Image.asset(onbordingpage[index].image,
                fit: BoxFit.fill,
                width: AppSize.s180,
                height: AppSize.s220,)),
          SizedBox(height: AppSize.s30,),
          Container(
            width: AppSize.s250,
            alignment: Alignment.center,
            child: Text(onbordingpage[index].description,style:
            getTextStyle(color: AppColors.gray,
                fontSize: FontSize.s20,
                fontweight: FontWeight.bold),),
          ),
        ],
      ),
    ) ;
  }
}
