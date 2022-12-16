import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/Themes.dart';
import 'package:shoping/app/Resource/styles.dart';
import 'package:shoping/presintation/Home/settingScreen/settingController.dart';

class SettingScreen extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    Get.find<SettingController>();
    return Scaffold(
      //backgroundColor: Theme.of(context).textTheme.bodyText1,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profile Setting",style: getTextStyle(color: Colors.green,
            fontSize: FontSize.s20,fontweight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: GetBuilder<SettingController>(builder:(controller){
        if(controller.isloading){
          return Center(child: CircularProgressIndicator(),);
        }else{
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 170,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(4.0),)
                            ),
                            child: Image.asset("assets/images/imagecover.jpg",
                              fit: BoxFit.cover,width: double.infinity,),
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            controller.userEntites.profileimage==null?CircleAvatar(
                              radius: 55,
                              backgroundImage: AssetImage("assets/images/person.png"),
                            ):CircleAvatar(
                              radius: 55.0,
                              backgroundImage:
                              NetworkImage(controller.userEntites.profileimage!),
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.camera_alt,size: 35,color: Colors.blueAccent,),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
//                      Text("username: ",style:
//                      getTextStyle(color:Colors.black87,
//                          fontSize: FontSize.s20,
//                          fontweight: FontWeight.bold),maxLines: 2,),
                    Text("username : ",style: Theme.of(context).textTheme.headline6,),
                      Text(controller.userEntites.name,
                        style: Theme.of(context).textTheme.headline6,),
                      SizedBox(width: 10,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Email: ",style: Theme.of(context).textTheme.headline6,),
                      Text(controller.userEntites.email,
                        style: Theme.of(context).textTheme.headline6,),
                      SizedBox(width: 30,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                    ],
                  ),
                  Divider(),
                  ListTile(
                    leading:Text("My Favorites Product",
                      style: getTextStyle(color: Colors.green, fontSize: FontSize.s20),) ,
                    trailing: Icon(Icons.favorite,color: Colors.red,) ,

                  ),
                  ListTile(
                    leading:Text("My Orders ",
                      style: getTextStyle(color: Colors.green, fontSize: FontSize.s20),) ,
                    trailing: Icon(Icons.location_city,color: Colors.black87,) ,

                  ),
                  ListTile(
                    leading:Text("My Addressess ",
                      style: getTextStyle(color: Colors.green, fontSize: FontSize.s20),) ,
                    trailing: Icon(Icons.location_city,color: Colors.black87,) ,

                  ),
                  ListTile(
                    leading:Text("Change Password ",
                      style: getTextStyle(color: Colors.green, fontSize: FontSize.s20),) ,
                    trailing: Icon(Icons.lock,color: Colors.black87,) ,

                  ),
                  ListTile(
                    onTap: (){
                      if(Get.isDarkMode){
                        Get.changeTheme(Themes.lightThemeMode);
                      }else{
                        Get.changeTheme(Themes.darkThemeMode);

                      }
                    },
                    leading:Text("Change Theme ",
                      style: getTextStyle(color: Colors.green, fontSize: FontSize.s20),) ,
                    trailing: Icon(Icons.whatshot_rounded,color: Colors.black87,) ,

                  ),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green
                    ),
                    child: MaterialButton(
                      onPressed: (){
                        Get.defaultDialog(
                          title: "Warning",
                          middleText: "Do you want log out from this app ?",
                          onConfirm: ()async{
                           await controller.logOut();
                          },

                        );
                      },
                      child: Text("Log Out",style:
                      getTextStyle(color: Colors.white,fontSize: FontSize.s15),),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
