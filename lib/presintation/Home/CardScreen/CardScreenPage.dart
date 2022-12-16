import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/Appcolors.dart';
import 'package:shoping/app/Resource/styles.dart';
import 'package:shoping/presintation/Home/AddAddress/AddAddressScreen.dart';
import 'package:shoping/presintation/Home/AddAddress/addressBinding.dart';
import 'package:shoping/presintation/Home/CardScreen/CartController.dart';
import 'package:shoping/presintation/Home/productDetails/productDetailsController.dart';

class CardScreen extends GetView<CartController> {

  @override
  Widget build(BuildContext context) {
   // Get.find<ProductDetailsController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Cart",style: getTextStyle(color: Colors.green,
            fontSize: FontSize.s20),),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.delete,color: Colors.black45,)),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Center(
              child: Text("Remove all items",style: getTextStyle(color: Colors.black,
                  fontSize: FontSize.s15),),
            ),
          ),
        ],
      ),
      body: GetBuilder<CartController>(builder: (controller){
        if(controller.isloading){
          return Center(child: Text("No Product in your Cart"));
        }else{
          return Column(
            children: [
              Expanded(
                child: Container(
                    child:ListView.separated(
                      itemCount: controller.cartEntites.cartItems.length,
                      itemBuilder: (context,index){
                        return Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.network(
                                  "${controller.cartEntites.
                                  cartItems[index].image}",
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      "${controller.cartEntites.cartItems[index]
                                          .title}",
                                      style: getTextStyle(color: AppColors.black,
                                          fontSize: FontSize.s15,
                                          fontweight: FontWeight.bold),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      "price:${controller.cartEntites.
                                      cartItems[index].price.toInt()} \$",
                                      style: getTextStyle(color: Colors.blue,
                                          fontSize: FontSize.s15,
                                          fontweight: FontWeight.normal),),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Quantity : "),
                                      Text("${controller.cartEntites.cartItems[index].quantity.toInt()}"),
                                    ],
                                  )
                                ],
                              ),
                              IconButton(onPressed: () async{
                          await  controller.removeProductFromCart(controller.
                            cartEntites.cartItems[index].id.toString());
                              }, icon: Icon(Icons.delete,
                                color: Colors.black38, size: 30,))
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context,index){
                        return Container(
                          height: 2,
                        );
                      },
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Text("Total Price",style: getTextStyle(color:
                          Colors.green,
                              fontSize: FontSize.s20),),
                          SizedBox(height: 5,),
                          Text("\$ ${controller.cartEntites.totalprice.toInt()} ",style: getTextStyle(color: Colors.blueAccent,
                              fontSize: FontSize.s15),),
                        ],
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green,
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          Get.to(()=>AddressScreen(controller.cartEntites.CartId),
                          binding: AddressessBinding());
                        },
                        child:  Text("CheckOut",style: getTextStyle(color:
                        Colors.white,
                            fontSize: FontSize.s15),),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }
      },),
    );
  }
}
