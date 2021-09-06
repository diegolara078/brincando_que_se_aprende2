import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String usersCollection = "users";
  //Rx<UserModel> userModel = UserModel().obs;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() async {
    //initializeUserModel();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void signIn(String email, password) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    try {
      await auth
          .signInWithEmailAndPassword(email: email.trim(), password: password)
          .then((result) {
        String _userId = result.user!.uid;
        _clearControllers();
        Get.toNamed("/menuAtividades", arguments: {"id": _userId.toString()});
      });
    } catch (erro) {
      debugPrint(erro.toString());
      Get.snackbar("Login Falhou", "Tente novamente");
    }
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  void signUp(String email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password)
          .then((result) {
        String _userId = result.user!.uid;
        _addUserToFirestore(_userId);
        Get.toNamed("/home", arguments: {"id": _userId.toString()});
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Criar usuário Falhou", "Tente novamente");
    }
  }

  void signOut() async {
    await auth.signOut();
    print("Usuario atual está DESLOGADO!!");
    Get.toNamed("/login");
  }

  _addUserToFirestore(String userId) {
    print(name.text.trim());
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": name.text.trim(),
      "id": userId,
      "email": email.text.trim(),
      "atividade": "1",
      //"cart": []
    });
  }
}
