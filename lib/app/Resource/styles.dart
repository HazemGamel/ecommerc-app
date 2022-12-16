
import 'package:flutter/cupertino.dart';
import 'package:shoping/app/Resource/AppSize.dart';

TextStyle getTextStyle({required Color color,
  required double fontSize, fontweight=FontWeight.normal}){
  return TextStyle(
    fontSize:fontSize ,
    fontWeight:fontweight ,
    color:color ,
  );
}