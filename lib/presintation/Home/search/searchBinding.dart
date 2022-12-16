import 'package:get/get.dart';
import 'package:shoping/presintation/Home/search/searchcontroller.dart';
import 'package:shoping/presintation/Home/search/searchusecase.dart';

class SearchBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController(Get.find<SearchUseCase>()));
  }

}