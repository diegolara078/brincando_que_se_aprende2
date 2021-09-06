import 'package:brincando_que_se_aprende/bindings/atividade_binding.dart';
import 'package:brincando_que_se_aprende/bindings/home_binding.dart';
import 'package:brincando_que_se_aprende/bindings/login_binding.dart';
import 'package:brincando_que_se_aprende/views/Historia/historia1.dart';
import 'package:brincando_que_se_aprende/views/atividades/atividade1.dart';
import 'package:brincando_que_se_aprende/views/atividades/atividade2.dart';
import 'package:brincando_que_se_aprende/views/home/menuAtividades.dart';
import 'package:brincando_que_se_aprende/views/login/login.dart';
import 'package:brincando_que_se_aprende/views/login/signup.dart';
import 'package:get/get.dart';

class Pages {
  static final routes = [
    GetPage(
      name: '/',
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/login',
      binding: LoginBinding(),
      page: () => LoginView(),
    ),
    GetPage(
      name: '/signup',
      page: () => Signup(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/menuAtividades',
      binding: HomeBinding(),
      page: () => MenuAtividades(),
    ),
    GetPage(
      name: '/Historias',
      page: () => Historias(),
      //binding: HomeBinding(),
    ),
    GetPage(
      name: '/Atividade1',
      page: () => Atividade1(),
      binding: AtividadeBinding(),
    ),
    GetPage(
      name: '/Atividade2',
      page: () => Atividade2(),
      binding: AtividadeBinding(),
    ),
    // GetPage(
    //   name: '/Atividade3',
    //   page: () => Atividade3(),
    //   binding: AtividadeBinding(),
    // ),
  ];
}
