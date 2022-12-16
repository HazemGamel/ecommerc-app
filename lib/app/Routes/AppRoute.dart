
import 'package:get/get.dart';
import 'package:shoping/presintation/Home/mainScreen.dart';
import 'package:shoping/presintation/Home/mainbinding.dart';
import 'package:shoping/presintation/login/loginbinding.dart';
import 'package:shoping/presintation/login/logincontroller.dart';
import 'package:shoping/presintation/login/loginscreen.dart';
import 'package:shoping/presintation/login/loginscreen.dart';
import 'package:shoping/presintation/onbording/binding.dart';
import 'package:shoping/presintation/onbording/onbordingScreen.dart';
import 'package:shoping/presintation/register/binding.dart';
import 'package:shoping/presintation/register/registerScreen.dart';
import 'package:shoping/presintation/restpassword/binding.dart';
import 'package:shoping/presintation/restpassword/checkemailscreen.dart';
import 'package:shoping/presintation/restpassword/codeScreen.dart';
import 'package:shoping/presintation/restpassword/newpasswordscreen.dart';
import 'package:shoping/presintation/splash/splashScreen.dart';

class AppRoutes{
  static const String initial = "/";
  static const String onBording = "/onbording";
  static const String login = "/login";
  static const String register = "/register";
  static const String checkEmail = "/checkemail";
  static const String mainscreen = "/mainscreen";
  static const String home = "/home";
  static const String codeScreen = "/codeScreen";
  static const String newpassword = "/newpassword";
}

class AppPages{
 static final pages = [
    GetPage(name: AppRoutes.onBording,
        page: ()=>OnbordingScreen(),binding: onbordingBinding()),
   GetPage(name: AppRoutes.login,
       page: ()=>LoginScreen(),binding: LoginBindings()),
   GetPage(name: AppRoutes.register,
       page: ()=>RegisterScreen(),binding: RegisterBinding()),
   GetPage(name: AppRoutes.checkEmail,
       page: ()=>CheckEmailScreen(),binding: CheckEmailBinding()),
   GetPage(name: AppRoutes.codeScreen,
       page: ()=>VerifyCodeScreen(),binding: CheckCodeBinding()),
   GetPage(name: AppRoutes.newpassword,
       page: ()=>RestPasswordScreen(),binding: RestPasswordBinding()),
   GetPage(name: AppRoutes.mainscreen,
       page: ()=>MainScreen(),binding: MainBindings()),
  ];
}