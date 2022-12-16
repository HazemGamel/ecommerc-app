import 'package:get/get.dart';
import 'package:shoping/app/constance/statusRequest.dart';
import 'package:shoping/domain/requests/restpasswordrequest.dart';
import 'package:shoping/presintation/restpassword/usecase.dart';

class CodeController extends GetxController{
  final CheckCodeUseCase checkCodeUseCase;

  CodeController(this.checkCodeUseCase);
  StatesRequest? statesRequest;

  checkCode(String restcode)async{
    statesRequest=StatesRequest.loading;
    update();
    final result = await checkCodeUseCase.execute(CodeRequest(code: restcode));
    result.fold((l) {
      Get.defaultDialog(title: "Warning", middleText: l.message);
      update();
    }, (r) {
      Get.toNamed("/newpassword");
    });
    statesRequest=StatesRequest.success;

    update();
  }

}