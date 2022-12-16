import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/Appcolors.dart';
import 'package:shoping/app/Resource/styles.dart';
import 'package:shoping/presintation/Home/favoriteScreen/FavoritUseCase.dart';
import 'package:shoping/presintation/Home/favoriteScreen/favoritecontroller.dart';

class FavoriteScreen extends GetView<FavoriteController> {
  @override
  Widget build(BuildContext context) {
    //Get.find<FavoriteController>().GetUserFavorite();
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorits Products"),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body:GetBuilder<FavoriteController>(builder: (controller){
        if(controller.products.isEmpty){
          return Center(child: Text("No Product In Your Favorite"));
        }else {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          child: Image.network(
                            controller.products[index].imagecover,
                            alignment: Alignment.center, fit: BoxFit.cover,),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                controller.products[index].title.toString(),
                                style: getTextStyle(color: AppColors.black,
                                    fontSize: FontSize.s15,
                                    fontweight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "price:${controller.products[index].price
                                    .toInt()}\$",
                                style: getTextStyle(color: Colors.blue,
                                    fontSize: FontSize.s15,
                                    fontweight: FontWeight.normal),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.star, color: Colors.amberAccent,),
                                Text("${controller.products[index].ratingavarage
                                    .toDouble()}"),
                              ],
                            )
                          ],
                        ),
                        IconButton(onPressed: () async{
                          await controller.removeProductFromFav(controller.
                          products[index].id.toString());
                        }, icon: Icon(Icons.delete,
                          color: Colors.black38, size: 30,))
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 0.6,
                    //color: Colors.grey[300],
                  );
                },
                itemCount: controller.products.length),
          );
        }
      },),
    );
  }
}
