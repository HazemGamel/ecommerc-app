import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/AppStrings.dart';
import 'package:shoping/app/Resource/Appcolors.dart';
import 'package:shoping/app/Resource/styles.dart';
import 'package:shoping/app/constance/statusRequest.dart';
import 'package:shoping/presintation/login/logincontroller.dart';
import 'package:shoping/presintation/widgets/textformfieldcustom.dart';

class LoginScreen extends GetView<LoginController> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Get.offNamed("/register");
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),

      ),
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  Text(AppStrings.signin,style: getTextStyle(
                      color: Colors.green,
                      fontSize: FontSize.s30,
                      fontweight: FontWeight.bold),),
                  SizedBox(height: AppSize.s30,),
                  TextFormFieldCustom(emailcontroller,
                          (v){
                        if(v!.isEmpty || !v.contains("@")){
                          return "please enter your valid email";
                        }
                        return null;
                      },
                      AppStrings.email,
                      AppStrings.enteremail,
                      TextInputType.emailAddress,
                      Icons.email
                  ),
                  TextFormFieldCustom(passwordcontroller,
                          (v){
                        if(v!.isEmpty){
                          return "please enter your password";
                        }else if(v.length<6){
                          return "your password must be greater than 6 ";
                        }
                        return null;
                      },
                      AppStrings.enterpassword,
                      AppStrings.password,
                      TextInputType.name,
                      Icons.visibility
                  ),
                  TextButton(onPressed: (){
                    Get.toNamed("/checkemail");
                  },
                      child: Text(AppStrings.forgetpassword,
                      style: getTextStyle(
                          color: AppColors.black,
                          fontSize: FontSize.s20),)),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: GetBuilder<LoginController>(
                      builder: (controller)=>
                      controller.statesRequest==StatesRequest.loading?
                      const CircularProgressIndicator(
                        color: AppColors.green,
                      ):MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: AppColors.green,
                        onPressed: ()async{
                          if(formkey.currentState!.validate()){
                            await controller.Login(
                                emailcontroller.text,
                                passwordcontroller.text);
                          }
                        },
                        child: Text(AppStrings.signin,style:
                        getTextStyle(color: AppColors.wight,
                            fontSize: FontSize.s12,
                            fontweight: FontWeight.bold),),),
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.nothaveaccount,style: getTextStyle(
                          color: AppColors.black,
                          fontSize: FontSize.s20,
                          fontweight: FontWeight.bold),),
                      TextButton(onPressed: (){
                        Get.offNamed("/register");
                      },
                          child: Text(AppStrings.register,
                            style: getTextStyle(
                                color: AppColors.green,
                                fontSize: FontSize.s20),))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
