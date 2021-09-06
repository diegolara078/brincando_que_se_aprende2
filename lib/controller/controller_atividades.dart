import 'package:brincando_que_se_aprende/data/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AtividadesController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //String collection = "usuarios";
  String usersCollection = "users";

  Rx<UserModel> userModel = UserModel().obs;
  var todos = <UserModel>[].obs;

  final GlobalKey<FormState> validaFormKey = GlobalKey<FormState>();

  TextEditingController texto1 = TextEditingController();
  TextEditingController texto2 = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    texto1 = TextEditingController();
    texto2 = TextEditingController();
  }

  @override
  void onClose() {
    texto1.dispose();
    texto2.dispose();
  }

  String? validateTexto1(String value) {
    if (value.toUpperCase() != "MAPA") return 'Tente novamente!';
    return null;
  }

  String? validateTexto2(String value) {
    if (value.toUpperCase() != "GATO") {
      return 'Tente novamente!';
    }
    return null;
  }

  void checkLogin(int numero) {
    final isValid = validaFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    updateFirestore(Get.arguments['id'], numero);
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> updateFirestore(String userId, atividade) {
    return users
        .doc(userId)
        .update({"atividade": atividade.toString()})
        .then((value) => Get.toNamed("/menuAtividades"))
        .catchError((error) =>
            Get.snackbar("Atualização Falhou", "Tente novamente $error"));
  }
}
