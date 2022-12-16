import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/app/Routes/AppRoute.dart';
import 'app/Resource/Themes.dart';
import 'datalayer/models/onbordingModel.dart';
import 'domain/entites/onbordingentites.dart';
import 'package:shoping/presintation/onbording/binding.dart';
import 'app/Binding.dart';
import 'presintation/onbording/onbordingScreen.dart';
import 'package:shoping/presintation/splash/splashScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initial();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "shoping",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialBinding: initalBindings(),
      initialRoute: AppRoutes.initial,
      getPages: AppPages.pages,
      home:  SplashScreen(),
    );
  }
}

