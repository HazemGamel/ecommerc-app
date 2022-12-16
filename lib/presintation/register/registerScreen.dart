import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/AppStrings.dart';
import 'package:shoping/app/Resource/Appcolors.dart';
import 'package:shoping/app/Resource/styles.dart';
import 'package:shoping/app/constance/statusRequest.dart';
import 'package:shoping/presintation/register/registercontroller.dart';
import 'package:shoping/presintation/widgets/textformfieldcustom.dart';

class RegisterScreen extends GetView<RegisterController> {
  TextEditingController namecontroller =TextEditingController();
  TextEditingController emailcontroller =TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();
  TextEditingController confirmpassswordcontroller =TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  Text(AppStrings.singup,style: getTextStyle(
                      color: Colors.green,
                      fontSize: FontSize.s30,
                  fontweight: FontWeight.bold),),
                  SizedBox(height: AppSize.s30,),
                  TextFormFieldCustom(namecontroller,
                      (v){
                      if(v!.isEmpty){
                        return "please enter your name";
                      }
                      return null;
                      },
                      AppStrings.username,
                      AppStrings.enterusername,
                      TextInputType.name,
                    Icons.person
                  ),
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
                  TextFormFieldCustom(confirmpassswordcontroller,
                          (v){
                        if(v!.isEmpty){
                          return "please enter your confirmpassword";
                        }
                        if(v.length<6){
                          return "your password must be greater than 6 ";
                        }
                        if(passwordcontroller.text != confirmpassswordcontroller.text){
                          return "please enter correct confirm password";
                        }
                        return null;
                      },
                      AppStrings.confirmyourpassword,
                      AppStrings.confirmpassword,
                      TextInputType.name,
                      Icons.visibility
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child:GetBuilder<RegisterController>(
                      builder: (controller)=>
                        controller.statesRequest==StatesRequest.loading ?
                            const CircularProgressIndicator(
                              color: AppColors.green,
                            ):MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: AppColors.green,
                          onPressed: ()async{
                            if(formkey.currentState!.validate()){
                              await controller.register(namecontroller.text,
                                  emailcontroller.text,
                                  passwordcontroller.text,
                                  confirmpassswordcontroller.text);
                            }
                            FocusScope.of(context).unfocus();
                            namecontroller.clear();
                          },
                          child: Text(AppStrings.singup,style:
                          getTextStyle(color: AppColors.wight,
                              fontSize: FontSize.s12,
                              fontweight: FontWeight.bold),),),
                    )
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.haveaccount,style: getTextStyle(
                          color: AppColors.black,
                          fontSize: FontSize.s20,
                          fontweight: FontWeight.bold),),
                      TextButton(onPressed: (){
                        Get.offNamed("/login");
                      },
                          child: Text(AppStrings.login,
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
