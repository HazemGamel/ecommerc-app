import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Routes/AppRoute.dart';
import 'package:shoping/presintation/Home/CardScreen/CardScreenPage.dart';
import 'package:shoping/presintation/Home/HomeScreen/HomeScreenPage.dart';
import 'package:shoping/presintation/Home/favoriteScreen/favoriteScreenPage.dart';
import 'package:shoping/presintation/Home/settingScreen/SettingScreenPage.dart';

class MainController extends GetxController{
   int  currentIndex=0;
 final List screens=[
    HomeScreen(),
    CardScreen(),
    FavoriteScreen(),
    SettingScreen()
  ];

  void changeIndex(int index){
    currentIndex=index;
   update();
  }

}