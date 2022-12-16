import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/AppStrings.dart';
import 'package:shoping/app/Resource/Appcolors.dart';
import 'package:shoping/app/Resource/styles.dart';
import 'package:shoping/app/constance/Appconstance.dart';
import 'package:shoping/app/constance/statusRequest.dart';
import 'package:shoping/presintation/Home/CardScreen/CartController.dart';
import 'package:shoping/presintation/Home/CardScreen/cartusecase.dart';
import 'package:shoping/presintation/Home/HomeScreen/HomeController.dart';
import 'package:shoping/presintation/Home/HomeScreen/HomeUseCase.dart';
import 'package:shoping/presintation/Home/favoriteScreen/FavoritUseCase.dart';
import 'package:shoping/presintation/Home/favoriteScreen/favoritecontroller.dart';
import 'package:shoping/presintation/Home/productDetails/ProductDetailsBinding.dart';
import 'package:shoping/presintation/Home/productDetails/ProductDetailsUseCase.dart';
import 'package:shoping/presintation/Home/productDetails/productDetailsController.dart';
import 'package:shoping/presintation/Home/productDetails/productDetailsScreen.dart';
import 'package:shoping/presintation/Home/search/searchBinding.dart';
import 'package:shoping/presintation/Home/search/searchscreen.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    HomeController homeController =   Get.put(
        HomeController(Get.find<HomeUseCase>()));
    FavoriteController favoriteController =
    Get.put(FavoriteController(Get.find<FavoriteUseCase>()));
    //Get.put(ProductDetailsController(Get.find<ProductDetailsUseCase>()));
    Get.put(CartController(Get.find<CartUseCase>()));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("SoukCom",style: TextStyle(color: Colors.green),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){
              Get.off(()=>SearchScreen(),binding: SearchBinding());
            }, icon: Icon(Icons.search)),
          ),
        ],
      ),
      body: Obx(
          ()=>homeController.isloading.value?
          Center(child: ShimerEffect()):Padding(
            padding: const EdgeInsets.only(top: 7,left: 7,right: 7),
            child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.Categories,
                        style: getTextStyle(color: AppColors.black,
                            fontSize: FontSize.s20,fontweight: FontWeight.bold),),
                      Text(AppStrings.seemore,
                        style: getTextStyle(color: AppColors.black,
                            fontSize: FontSize.s15,fontweight: FontWeight.bold),),
                    ],
                  ),
                  Obx(()=> Container(
                    height: 150,
                    child: ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.categories.length,
                        itemBuilder: (context,index){
                          return categoryShape(
                              homeController.categories[index].
                              categoryimage.toString(),
                              homeController.categories[index].categoryname);
                        }),
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.brands,
                        style: getTextStyle(color: AppColors.black,
                            fontSize: FontSize.s20,fontweight: FontWeight.bold),),
                      Text(AppStrings.seemore,
                        style: getTextStyle(color: AppColors.black,
                            fontSize: FontSize.s15,fontweight: FontWeight.bold),),
                    ],
                  ),
                  Obx(()=>Container(
                    height: 150,
                    child: ListView.builder(
                      reverse: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.brands.length,
                        itemBuilder: (context,index){
                          return brandsShape(
                            homeController.brands[index].brandimage,
                            homeController.brands[index].brandname
                          );
                        }),
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.Products,
                        style: getTextStyle(color: AppColors.black,
                            fontSize: FontSize.s20,fontweight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Obx(()=>Container(
                    color: Colors.grey[50],
                    child: GridView.count(
                      reverse: true,
                      shrinkWrap: true,
                      mainAxisSpacing: 0.5,
                      crossAxisSpacing: 0.5,
                      childAspectRatio: 1/1.5,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      children:
                      List.generate(homeController.products.length, (index) {
                        homeController.products.forEach((element) {
                          favoriteController.isFavorite.addAll({
                            element.id:true,
                          });
                        });
                        favoriteController.isFavorite[homeController.products[index].id]
                        = true;
                        return InkWell(
                          onTap: (){
                       Get.to(()=>ProductDetailsScreen(id:
                       homeController.products[index].id)
                           ,binding: ProductDetailsBinding());
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      homeController.products[index].imagecover,
                                      width: double.infinity,height: 200,fit: BoxFit.fill,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        homeController.products[index].
                                        title.toString(),
                                        maxLines: 2,overflow: TextOverflow.ellipsis,
                                        style: getTextStyle(color: Colors.black, fontSize: FontSize.s15),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          Text("price:${homeController
                                              .products[index].price.toInt()} \$",style:
                                          getTextStyle(color: Colors.blue, fontSize: FontSize.s15),),
                                          SizedBox(width: 10,),
                                          Row(
                                            children: [
                                              Icon(Icons.star,color: Colors.amberAccent,),
                                              Text("${homeController
                                                  .products[index].
                                              ratingavarage.toDouble()}"),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0,top: 4),
                                child: Container(
                                  height:40,
                                 width:40,
                                  decoration: BoxDecoration(
                                      color:Colors.black38,
                                    borderRadius: BorderRadius.circular(15)),
                                      child:  GetBuilder<FavoriteController>(
                                        builder: (c)=>
                                            IconButton(onPressed: (){
                                              if(c.isFavorite
                                              [homeController.products[index].id]=="1"){
                                                c.setFavorite(homeController
                                                    .products[index].id, "0");
                                              }else{
                                                c.setFavorite(homeController
                                                    .products[index].id, "1");
                                                c.AddProductsToFav(homeController
                                                    .products[index].id.
                                                toString());
                                                //c.GetUserFavorite();
                                              }
                                            },
                                          icon:Icon(Icons.favorite,
                                            color:c.isFavorite[homeController.products[index].id]
                                                =="1"? Colors.red:Colors.black,)),),
                                  ),
                                      ),


                            ],
                          ),
                        );
                      }),
                    ),
                  )),
                ],
              ),
            )

            ,),
      ),
      drawer:  Drawer(
          shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
      topRight: Radius.circular(20),
        bottomRight: Radius.circular(20)),
    ),
          child: Padding(
            padding: const EdgeInsets.only(top:40.0,left: 5,right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Filtering Products By ",
                    style: getTextStyle(color: Colors.black87,
                        fontSize: FontSize.s25,fontweight: FontWeight.bold),),
                ),
                ListTile(
                  leading: Text("Top Rated Products",style: getTextStyle(
                    color: Colors.black87,fontSize: FontSize.s20
                  ),),
                  trailing: IconButton(onPressed: (){},
                    icon: Icon(Icons.star,color: Colors.amber,),),
                ),
                ListTile(
                  leading: Text("Lowest Rated Products",style: getTextStyle(
                      color: Colors.black87,fontSize: FontSize.s20
                  ),),
                  trailing: IconButton(onPressed: (){},
                    icon: Icon(Icons.star_border,color: Colors.grey,),),
                ),
                ListTile(
                  leading: Text("Top Price Products",style: getTextStyle(
                      color: Colors.black87,fontSize: FontSize.s20
                  ),),
                  trailing: IconButton(onPressed: (){},
                    icon: Icon(Icons.money,color: Colors.green,),),
                ),
                ListTile(
                  leading: Text("Top Selling Products",style: getTextStyle(
                      color: Colors.black87,fontSize: FontSize.s20
                  ),),
                  trailing: IconButton(onPressed: (){},
                    icon: Icon(Icons.sell_outlined,color: Colors.green,),),
                ),
                ListTile(
                  leading: Text("Lowest price Products",style: getTextStyle(
                      color: Colors.black87,fontSize: FontSize.s20
                  ),),
                  trailing: IconButton(onPressed: (){},
                    icon: Icon(Icons.monetization_on,color: Colors.green,),),
                ),

              ],
            ),
          ),
        ),
    );
  }
}

Widget categoryShape(String image,String name){
  return Padding(
    padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
               child: Image.network(image,
                 fit: BoxFit.cover,alignment: Alignment.center,),
            ),
          ),
          Container(
            width: 100,
              child: Text(name,
                style: getTextStyle(color: Colors.black, fontSize: FontSize.s15),
                textAlign: TextAlign.center,maxLines: 3,))
        ],
      ),
  );
}
Widget brandsShape(String image,String name){
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Image.network(image,
              fit: BoxFit.cover,
              ),
          ),
        ),
        Container(
            width: 100,
            child: Text(name,
              style: getTextStyle(color: Colors.black, fontSize: FontSize.s15),
              textAlign: TextAlign.center,))
      ],
    ),
  );
}

Widget productShape(int length,String image,String title,double price , double rating){
  return Container(
    color: Colors.grey[50],
    child: GridView.count(
      shrinkWrap: true,
      mainAxisSpacing: 0.5,
      crossAxisSpacing: 0.5,
      childAspectRatio: 1/1.5,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
    children:
      List.generate(length, (index) {
        return InkWell(
          onTap: (){},
          child: Stack(
            children: [
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(image,
                      width: double.infinity,height: 200,fit: BoxFit.cover,),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(title,
                        maxLines: 2,overflow: TextOverflow.ellipsis,
                      style: getTextStyle(color: Colors.black, fontSize: FontSize.s15),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          Text("price:${price.toString()} \$",style:
                          getTextStyle(color: Colors.blue, fontSize: FontSize.s15),),
                          SizedBox(width: 10,),
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.amberAccent,),
                              Text(rating.toString()),
                            ],
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.grey,)),
            ],
          ),
        );
      }),
    ),
  );
}

Widget ShimerEffect(){
  return Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: Colors.grey,
    child: Padding(
        padding: const EdgeInsets.only(top: 7,left: 7,right: 7),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Container(height:30,width:100,color: Colors.grey,),
                 Container(height:30,width:100,color: Colors.grey,),
                ],
              ),
              Container(
                height: 150,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(height: 100,width: 100,color: Colors.grey,),
                          ),
                          Container(height: 30,width: 100,color: Colors.grey,),
                        ],
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height:30,width:100,color: Colors.grey,),
                  Container(height:30,width:100,color: Colors.grey,),
                ],
              ),
              Container(
                height: 150,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context,index){
                      return  Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(height: 100,width: 100,color: Colors.grey,),
                          ),
                          Container(height: 30,width: 100,color: Colors.grey,),
                        ],
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height:30,width:100,color: Colors.grey,),
                ],
              ),
              SizedBox(height: 5,),
              Container(
                color: Colors.grey[50],
                child: GridView.count(
                  shrinkWrap: true,
                  mainAxisSpacing: 0.5,
                  crossAxisSpacing: 0.5,
                  childAspectRatio: 1/1.5,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children:
                  List.generate(8, (index) {
                    return InkWell(
                      onTap: (){},
                      child: Stack(
                        children: [
                          Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(height: 100,
                                   width: double.infinity,color: Colors.grey,),
                               ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(height: 30,width: 30,color: Colors.grey,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Row(
                                    children: [
                                      Container(height: 20,width: 20,color: Colors.grey,),
                                      //SizedBox(width: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(height:30,width:30,
                                            color: Colors.grey,),
                                          Container(height:30,width:50,
                                            color: Colors.grey,),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                         Container(height: 50,width: 40,color: Colors.grey,)
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        )
    ),
  );
}