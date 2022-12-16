
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences  {
  late SharedPreferences sharedPreferences;
  Future<AppPreferences> init()async{
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

}

