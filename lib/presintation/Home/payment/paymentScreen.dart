
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/styles.dart';
import 'package:shoping/presintation/Home/AddAddress/AddAddressScreen.dart';
import 'package:shoping/presintation/Home/CardScreen/CardScreenPage.dart';
import 'package:shoping/presintation/Home/payment/paymentcontroller.dart';

class PaymentScreen extends GetView<PaymentController> {
  var id;
   PaymentScreen( this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Payment",style: getTextStyle(color: Colors.green,
            fontSize: FontSize.s17,fontweight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.off(()=>CardScreen());
        },icon: Icon(Icons.arrow_back,color: Colors.black,),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Payment By ",style: getTextStyle(color: Colors.black,
          fontSize: FontSize.s30,fontweight: FontWeight.bold),),
          InkWell(
            onTap: ()async{
        await  controller.paymentSession(id);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Visa",style: getTextStyle(color: Colors.black,
                    fontSize: FontSize.s30,fontweight: FontWeight.bold),),
                SizedBox(width: 10,),
                Container(
                  height: 150,
                    width: 80,
                    child: Image.asset("assets/images/visa.png",)),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Cash",style: getTextStyle(color: Colors.black,
                  fontSize: FontSize.s30,fontweight: FontWeight.bold),),
              SizedBox(width: 10,),
              Container(
                height: 150,
                  width: 80,
                  child: Image.asset("assets/images/cash.jpg",)),
            ],
          ),
        ],
      )
    );
  }
}
