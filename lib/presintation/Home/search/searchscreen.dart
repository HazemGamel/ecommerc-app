
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/Appcolors.dart';
import 'package:shoping/app/Resource/styles.dart';
import 'package:shoping/presintation/Home/HomeScreen/HomeScreenPage.dart';
import 'package:shoping/presintation/Home/mainScreen.dart';
import 'package:shoping/presintation/Home/search/searchcontroller.dart';

class SearchScreen extends GetView<SearchController> {
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //Get.find<SearchController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Search in Products",
          style: getTextStyle(color: Colors.green,
              fontSize: FontSize.s20),),
        elevation: 0.0,
        leading: IconButton(onPressed: (){
          Get.off(()=>MainScreen());
        },
          icon: Icon(Icons.arrow_back,color: Colors.black87,),),
      ),
      body:Padding(
        padding: const EdgeInsets.all(4.0),
        child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.searchController,
                    decoration:InputDecoration(
                      suffixIcon: IconButton(onPressed: (){
                        controller.removesearch();
                      },
                        icon: Icon(Icons.clear,color: Colors.black87,),),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Colors.red,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      enabledBorder:OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blueGrey
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ) ,
                      hintText: "Search",
                      labelText: "Search",
                      labelStyle: TextStyle(
                          color: Colors.teal
                      ),
                    ),
                  validator: (vale){
                    if(vale!.isEmpty){
                      return "please enter your text to search";
                    }
                  },
                  onChanged:(text){
                    if(formkey.currentState!.validate()){
                      controller.searchProduct(text.trim());
                    }
                  } ,
                ),
//              TextFormFieldCustom(controller.searchController,
//                    (vale){
//                  if(vale!.isEmpty){
//                    return "please enter your text to search";
//                  }
//                },
//                "Search",
//                "Search",
//                TextInputType.text,
//                Icons.search,
//                functionsubmet: (text){
//                if(formkey.currentState!.validate()){
//                  controller.searchProduct(text!.trim());
//                }
//                },
//              ),
                   GetBuilder<SearchController>(builder: (controller){
                     return Expanded(
                       child: ListView.separated(
                           itemBuilder: (context,index){
                             return Card(
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Container(
                                     height: 100,
                                     width: 150,
                                     child: Image.network(
                                       controller.products[index].images[0].toString(),
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
                                           Text("${controller.products[index].ratingAverage
                                               .toDouble()}"),
                                         ],
                                       )
                                     ],
                                   ),
                                   IconButton(onPressed: () {

                                   }, icon: Icon(Icons.favorite_border,
                                     color: Colors.black38, size: 30,))
                                 ],
                               ),
                             );
                           },
                           separatorBuilder: (context,index){
                             return Divider();
                           },
                           itemCount: controller.products.length),

                     );
                   }),
          ]
            )
          ),
      )
    );
  }

//  Widget SearchProductShape(String image,String title ,int price ,double rating){
//    return Card(
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: [
//          Container(
//            height: 100,
//            width: 150,
//            child: Image.network(
//              controller.products[index].imagecover,
//              alignment: Alignment.center, fit: BoxFit.cover,),
//          ),
//          Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              Padding(
//                padding: const EdgeInsets.only(bottom: 10.0),
//                child: Text(
//                  controller.products[index].title.toString(),
//                  style: getTextStyle(color: AppColors.black,
//                      fontSize: FontSize.s15,
//                      fontweight: FontWeight.bold),),
//              ),
//              Padding(
//                padding: const EdgeInsets.only(bottom: 8.0),
//                child: Text(
//                  "price:${controller.products[index].price
//                      .toInt()}\$",
//                  style: getTextStyle(color: Colors.blue,
//                      fontSize: FontSize.s15,
//                      fontweight: FontWeight.normal),),
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: [
//                  Icon(Icons.star, color: Colors.amberAccent,),
//                  Text("${controller.products[index].ratingavarage
//                      .toDouble()}"),
//                ],
//              )
//            ],
//          ),
//          IconButton(onPressed: () async{
//            await controller.removeProductFromFav(controller.
//            products[index].id.toString());
//          }, icon: Icon(Icons.delete,
//            color: Colors.black38, size: 30,))
//        ],
//      ),
//    );
//  }
}
