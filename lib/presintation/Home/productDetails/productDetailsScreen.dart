import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/styles.dart';
import 'package:shoping/presintation/Home/CardScreen/CartController.dart';
import 'package:shoping/presintation/Home/CardScreen/cartusecase.dart';
import 'package:shoping/presintation/Home/productDetails/ProductDetailsBinding.dart';
import 'package:shoping/presintation/Home/productDetails/ReviewsScreen.dart';
import 'package:shoping/presintation/Home/productDetails/productDetailsController.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
    var id;
   ProductDetailsScreen({required this.id});
  @override
  Widget build(BuildContext context) {
    Get.find<ProductDetailsController>()
        .getProductDetails(id);
   // Get.lazyPut(() => (CartController(Get.find<CartUseCase>())));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Product Details",style: getTextStyle(color:Colors.green,
            fontSize: FontSize.s17,fontweight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.offNamed("mainscreen");
        },icon: Icon(Icons.arrow_back,color: Colors.black,),),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: GetBuilder<ProductDetailsController>(builder: (controller){
          if(controller.isloading){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: controller.productDetailsEntites.images
                      .map((e) => Center(
                    child: Container(
                      child: Image.network(e,fit: BoxFit.cover,
                        width: double.infinity,),
                    ),
                  )).toList(),
                  options:  CarouselOptions(
                    height: 250,
                    aspectRatio: 16/9,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text("Details of Product",style: getTextStyle(color: Colors.black,
                            fontSize: FontSize.s17,fontweight: FontWeight.bold),),
                      ),
                      Container(
                        child: InkWell(
                          onTap: (){
                         Get.to(()=>ReviewsScreen());
                          },
                          child: Text("Reviews",
                              style: getTextStyle(color: Colors.amberAccent,
                              fontSize: FontSize.s17,fontweight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Title : ${controller.productDetailsEntites.
                            title}",style: getTextStyle(color: Colors.blueAccent,
                                fontSize: FontSize.s15),),
                            SizedBox(height: 5,),
                            Text("quantity : ${controller.productDetailsEntites
                                .quantity.toInt()} ",style: getTextStyle(color: Colors.blueAccent,
                                fontSize: FontSize.s15),),
                            SizedBox(height: 5,),

                            Text("Sold : ${controller.productDetailsEntites
                                .sold.toInt()} ",style: getTextStyle(color: Colors.blueAccent,
                                fontSize: FontSize.s15),),
                            SizedBox(height: 5,),

                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text("Ratings : ${controller.productDetailsEntites
                                        .ratingAverage.toDouble()}",style: getTextStyle(color: Colors.blueAccent,
                                        fontSize: FontSize.s15),),
                                    SizedBox(width: 3,),
                                    Icon(Icons.star,color: Colors.amberAccent,),
                                  ],
                                ),
                                SizedBox(width: 30,),
                                Text("RatingQuantity :${controller.productDetailsEntites
                                    .ratingQuantity.toInt()}",style: getTextStyle(color: Colors.blueAccent,
                                    fontSize: FontSize.s15),),
                              ],
                            ),
                            SizedBox(height: 5,),

                            Row(
                              children: [
                                Text("Category : ${controller.productDetailsEntites
                                    .category!.name}",style: getTextStyle(color: Colors.blueAccent,
                                    fontSize: FontSize.s15),),
                                SizedBox(width: 30,),
                                Text("Brand : ${controller.productDetailsEntites
                                    .brand!.name}",style: getTextStyle(color: Colors.blueAccent,
                                    fontSize: FontSize.s15),),
                              ],
                            ),
                            SizedBox(height: 5,),

                            Text("Description :${controller.productDetailsEntites
                                .description} ",style: getTextStyle(color: Colors.blueAccent,
                                fontSize: FontSize.s15),),
                          ],
                        ),
                      ),
                    ),
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
                            Text("Price",style: getTextStyle(color:
                            Colors.green,
                                fontSize: FontSize.s20),),
                            SizedBox(height: 5,),
                            Text("\$ ${controller.productDetailsEntites
                                .price.toInt()} ",style: getTextStyle(color: Colors.blueAccent,
                                fontSize: FontSize.s15),),
                          ],
                        ),
                      ),
                      GetBuilder<CartController>(
                        builder: (controller)=>Container(
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: MaterialButton(
                          onPressed: (){
                        controller.addProductToCart(id);
                          },
                          child:  Text("Add To Cart",style: getTextStyle(color:
                          Colors.white,
                              fontSize: FontSize.s15),),
                        ),
                      ),)
                    ],
                  ),
                )
              ],
            );
          }

      },) ,
    );
  }
}
