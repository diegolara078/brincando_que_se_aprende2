import 'package:brincando_que_se_aprende/controller/controller_login.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    //Get.lazyPut
    // É possível lazyPut uma dependência para que ela seja instanciada apenas quando for usada.
    //para cada módulo temos um arquivo que representa
    // iniciado junto com as rotas
    //Get.lazyPut<LoginController>(() => LoginController());
    Get.put(LoginController());
  }
}
