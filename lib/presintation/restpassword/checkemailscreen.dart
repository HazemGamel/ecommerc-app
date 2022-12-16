import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/AppStrings.dart';
import 'package:shoping/app/Resource/Appcolors.dart';
import 'package:shoping/app/Resource/styles.dart';
import 'package:shoping/app/constance/statusRequest.dart';
import 'package:shoping/presintation/restpassword/checkemailcontroller.dart';
import 'package:shoping/presintation/widgets/textformfieldcustom.dart';

class CheckEmailScreen extends GetView<CheckEmailController> {
  TextEditingController emailcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
        children: [
                 const SizedBox(height: AppSize.s50,),

                      Text(AppStrings.forgetpassword2,
                style: getTextStyle(color: AppColors.gray,
                    fontSize: FontSize.s20,fontweight: FontWeight.bold),),
              const SizedBox(height: AppSize.s20,),
              Text(AppStrings.checkemail,
                style: getTextStyle(color: AppColors.black,
                    fontSize: FontSize.s30,fontweight: FontWeight.bold),),
          const SizedBox(height: AppSize.s12,),
           Padding(
               padding: const EdgeInsets.all(10.0),
               child: Text(AppStrings.pleasecheckyouremail,
                style: getTextStyle(color: AppColors.gray,
                    fontSize: FontSize.s15),),
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
          Padding(padding: EdgeInsets.all(8.0),
              child:GetBuilder<CheckEmailController>(
                builder: (controller)=>
                    controller.statesRequest== StatesRequest.loading ?
                        const CircularProgressIndicator(color: AppColors.green,):
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: AppColors.green,
                      onPressed: ()async{
                        if(formkey.currentState!.validate()){
                          await controller.checkEmail(emailcontroller.text);
                        }
                      },
                      child: Text(AppStrings.sendcode,style:
                      getTextStyle(color: AppColors.wight,
                          fontSize: FontSize.s12,
                          fontweight: FontWeight.bold),),),

              ),

          )

        ],
      ),
            ),
          )),
    );
  }
}
