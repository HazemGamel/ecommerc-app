
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Resource/AppSize.dart';
import 'package:shoping/app/Resource/AppStrings.dart';
import 'package:shoping/app/Resource/styles.dart';
import 'package:shoping/presintation/Home/AddAddress/addressController.dart';
import 'package:shoping/presintation/Home/CardScreen/CardScreenPage.dart';
import 'package:shoping/presintation/widgets/textformfieldcustom.dart';

class AddressScreen extends GetView<AddressController> {
  TextEditingController placecontroller =TextEditingController();
  TextEditingController streetcontroller =TextEditingController();
  TextEditingController phonecontroller =TextEditingController();
  TextEditingController citycontroller =TextEditingController();
  TextEditingController postalcodecontroller =TextEditingController();
  final formkey = GlobalKey<FormState>();
   var id;
   AddressScreen( this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Addressess",style: getTextStyle(color: Colors.green,
            fontSize: FontSize.s17,fontweight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.off(()=>CardScreen());
        },icon: Icon(Icons.arrow_back,color: Colors.black,),),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
               TextFormFieldCustom(placecontroller,
                       (v){
                     if(v!.isEmpty){
                       return "please enter your place";
                     }
                     return null;
                   },
                   "work,home..",
                   "place",
                   TextInputType.name,
                   Icons.home
               ),
               TextFormFieldCustom(streetcontroller,
                       (v){
                     if(v!.isEmpty ){
                       return "please enter your Street ";
                     }
                     return null;
                   },
                   "Street",
                   "Your Street",
                   TextInputType.name,
                   Icons.home
               ),
               TextFormFieldCustom(phonecontroller,
                       (v){
                     if(v!.isEmpty){
                       return "please enter your phone";
                     }else if(v.length<10){
                       return " enter vaild phone number";
                     }
                     return null;
                   },
                   "phone",
                   "phone",
                   TextInputType.phone,
                   Icons.call
               ),
               TextFormFieldCustom(citycontroller,
                       (v){
                     if(v!.isEmpty){
                       return "please enter your city name";
                     }
                     return null;
                   },
                   "city",
                   "city",
                   TextInputType.name,
                   Icons.location_city
               ),
               TextFormFieldCustom(postalcodecontroller,
                       (v){
                     if(v!.isEmpty){
                       return "please enter your postal code";
                     }
                     return null;
                   },
                   "postalCode",
                   "postalCode",
                   TextInputType.number,
                   Icons.location_city
               ),
              GetBuilder<AddressController>(builder: (controller){
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Container(
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: MaterialButton(
                          onPressed: ()async{
                            if(formkey.currentState!.validate()){
                             await controller.addAddressess(placecontroller.text,
                                 citycontroller.text,
                                 phonecontroller.text,
                                 streetcontroller.text,
                                 postalcodecontroller.text,
                                 id);
                            }
                          },
                          child:  Text("Continue",style: getTextStyle(color:
                          Colors.white,
                              fontSize: FontSize.s15),),
                        ),
                      ),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
