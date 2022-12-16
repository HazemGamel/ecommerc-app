
import 'package:get/get.dart';
import 'package:shoping/app/constance/statusRequest.dart';
import 'package:shoping/domain/requests/restpasswordrequest.dart';
import 'package:shoping/presintation/restpassword/usecase.dart';

class CheckEmailController extends GetxController{
  final CheckEmailUseCase checkEmailUseCase;

  CheckEmailController(this.checkEmailUseCase);
  StatesRequest? statesRequest;

Future<void>  checkEmail(String emailText)async{
    statesRequest=StatesRequest.loading;
    update();
    final result = await checkEmailUseCase.execute(EmailRequest(email: emailText));
    result.fold((l) {
      Get.defaultDialog(title: "Warning", middleText: l.message);
      update();
    }, (r) {
      Get.toNamed("/codeScreen");}
      );
    statesRequest=StatesRequest.success;
    update();

  }

}