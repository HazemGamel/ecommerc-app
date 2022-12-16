
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/styles.dart';
import 'package:shoping/presintation/Home/productDetails/productDetailsController.dart';
import 'package:shoping/presintation/Home/productDetails/productDetailsScreen.dart';

class  ReviewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.find<ProductDetailsController>();//.getReviews();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(" Customer Reviews",
        style: getTextStyle(color: Colors.green,
        fontSize: FontSize.s20),),
    elevation: 0.0,
         leading: IconButton(onPressed: (){
           Get.back();
    },
    icon: Icon(Icons.arrow_back,color: Colors.black87,),),
    ),
      body: GetBuilder<ProductDetailsController>(builder: (controller){
        if(controller.reviews.isEmpty){
          return Center(child: Text("NO Reviews On This Product",style: getTextStyle(color: Colors.black87,
              fontSize: FontSize.s20,fontweight: FontWeight.bold)));
        }
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 120,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  controller.reviews[index].user!.profileimage==null?
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage("assets/images/person.png"),
                                  ):CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        controller.reviews[index].user!.profileimage.toString()
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    "${controller.reviews[index].user!.name.toString()}",
                                    style: getTextStyle(color: Colors.black87,
                                        fontSize: FontSize.s17,fontweight: FontWeight.normal),),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("${controller.reviews[index].title} ",
                                  style: getTextStyle(color: Colors.blueAccent,
                                      fontSize: FontSize.s15),),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star,color: Colors.amber,size: 25,),
                                  SizedBox(width: 10,),
                                  Text("${controller.reviews[index].ratings!.toDouble()}",style: getTextStyle(color: Colors.amber,fontSize: FontSize.s17),),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context,index){
                      return Divider();
                    }, itemCount: controller.reviews.length),
              ],
            ),
          );

      },),
    );
  }
}
