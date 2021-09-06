import 'package:brincando_que_se_aprende/controller/controller_home.dart';
import 'package:brincando_que_se_aprende/controller/controller_login.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
