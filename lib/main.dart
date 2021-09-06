import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'bindings/application_bindings.dart';
//import 'bindings/login_binding.dart';
import 'routes/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login GetX',
      // theme: ThemeData(
      //   primaryColor: Colors.black,
      //   scaffoldBackgroundColor: Colors.black,
      // ),
      //initialBinding: LoginBinding(),
      getPages: Pages.routes,
      initialRoute: '/',
      locale: Locale('pt', 'BR'),
    ),
  );
}
