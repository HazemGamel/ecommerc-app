import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/AppStrings.dart';
import 'package:shoping/app/Resource/Appcolors.dart';
import 'package:shoping/app/Resource/styles.dart';
import 'package:shoping/app/constance/statusRequest.dart';
import 'package:shoping/presintation/restpassword/newpasswordcontroller.dart';
import 'package:shoping/presintation/widgets/textformfieldcustom.dart';

class RestPasswordScreen extends GetView<RestPasswordController> {
  TextEditingController emailcontroller =TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: ListView(
            children:[
              Column(
                children: [
                  const SizedBox(height: AppSize.s30,),
                  Text(AppStrings.newpassword,style: getTextStyle(
                      color: Colors.black,
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
                      AppStrings.newpassword,
                      TextInputType.name,
                      Icons.visibility
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: GetBuilder<RestPasswordController>(
                      builder: (controller)=>
                          controller.statesRequest==StatesRequest.loading?
                              CircularProgressIndicator(color: AppColors.green,):
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: AppColors.green,
                            onPressed: ()async{
                              if(formkey.currentState!.validate()){
                                controller.restPassword(emailcontroller.text,
                                    passwordcontroller.text);
                              }
                            },
                            child: Text(AppStrings.update,style:
                            getTextStyle(color: AppColors.wight,
                                fontSize: FontSize.s12,
                                fontweight: FontWeight.bold),),),

                    )
                  )
                  ,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
