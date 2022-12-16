import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shoping/app/Resource/Appcolors.dart';
import 'package:shoping/datalayer/models/registerResponseModel.dart';
import 'package:shoping/domain/entites/registerresponseentites.dart';
import 'package:shoping/presintation/Home/CardScreen/CartController.dart';
import 'package:shoping/presintation/Home/CardScreen/cartusecase.dart';
import 'package:shoping/presintation/Home/favoriteScreen/favoritecontroller.dart';
import 'package:shoping/presintation/Home/maincontroller.dart';
import 'package:shoping/presintation/Home/productDetails/ProductDetailsUseCase.dart';
import 'package:shoping/presintation/Home/productDetails/productDetailsController.dart';
import 'package:shoping/presintation/Home/settingScreen/settingController.dart';
import 'package:shoping/presintation/Home/settingScreen/settingusecase.dart';
import 'package:shoping/presintation/widgets/textformfieldcustom.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller){
      return  Scaffold(
        body: controller.screens[controller.currentIndex],
        bottomNavigationBar: GNav(
            selectedIndex: controller.currentIndex,
            onTabChange: (i){
              controller.changeIndex(i);
            },
            backgroundColor: AppColors.grayops,
            color: Colors.black45,
            activeColor: Colors.green[500],
            // tab button hover color
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // navigation bar padding
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'card',
//                onPressed: (){
//                  Get.lazyPut(() => ProductDetailsController(Get.find<ProductDetailsUseCase>()));
//                },
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Likes',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Profile',
                onPressed: (){
                  Get.lazyPut(() => SettingController(Get.find<UserUseCase>()));
                },
              )
            ]
        ),
      );
    });
  }
}
