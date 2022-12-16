
import 'package:get/get.dart';
import 'package:shoping/app/constance/statusRequest.dart';
import 'package:shoping/domain/requests/restpasswordrequest.dart';
import 'package:shoping/presintation/restpassword/usecase.dart';

class RestPasswordController extends GetxController{
  final RestPasswordUseCase restPasswordUseCase;

  RestPasswordController(this.restPasswordUseCase);
  StatesRequest? statesRequest;

  restPassword(String email,String password)async{
    statesRequest=StatesRequest.loading;
    update();
      final result = await restPasswordUseCase.execute(
          NewPasswordRequest(email: email,
              newpassword: password));
      result.fold((l) {
        Get.defaultDialog(title: "Warning", middleText: l.message);
        update();
      }, (r){
        Get.offNamed("/login");
      });
    statesRequest=StatesRequest.success;
    update();
  }


}