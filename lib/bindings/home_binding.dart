import 'package:brincando_que_se_aprende/controller/controller_home.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    //Get.lazyPut
    // É possível lazyPut uma dependência para que ela seja instanciada apenas quando for usada.
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
