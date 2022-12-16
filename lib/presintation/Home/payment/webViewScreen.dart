

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/styles.dart';
import 'package:shoping/presintation/Home/CardScreen/CardScreenPage.dart';
import 'package:shoping/presintation/Home/HomeScreen/HomeScreenPage.dart';
import 'package:shoping/presintation/Home/mainScreen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class  WebViewScreen extends StatelessWidget {
  var url;
   WebViewScreen( this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Payment",style: getTextStyle(color: Colors.green,
            fontSize: FontSize.s17,fontweight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.off(()=>MainScreen());
        },icon: Icon(Icons.arrow_back,color: Colors.black,),),
      ),
      body:WebView(
        initialUrl: '$url',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
