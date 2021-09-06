import 'package:brincando_que_se_aprende/controller/controller_atividades.dart';
import 'package:get/get.dart';

class AtividadeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AtividadesController>(() => AtividadesController());
  }
}
