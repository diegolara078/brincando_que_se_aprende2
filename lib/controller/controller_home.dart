import 'package:brincando_que_se_aprende/data/model/user.dart';
//import 'package:brincando_que_se_aprende/views/atividades/atividade1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //static ProducsController instance = Get.find();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String collection = "usuarios";
  String usersCollection = "users";

  Rx<UserModel> userModel = UserModel().obs;
  var todos = <UserModel>[].obs;

  static HomeController instance = Get.find();

  @override
  // ignore: must_call_super
  onInit() async {
    super.onInit();
  }

  @override
  onReady() {
    super.onReady();
    userModel.bindStream(initializeUserModel());
  }

  Stream<UserModel> initializeUserModel() => firebaseFirestore
      .collection(usersCollection)
      .doc("AwwcLR0vf7eByEm0uGHG1cXqfzj2")
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));

  Stream<QuerySnapshot> getAllProducts3(ati) {
    print(ati);
    if (ati == null) {
      ati = "1";
    }
    var num = int.parse(ati);

    return FirebaseFirestore.instance
        .collection('menuAtividades')
        .where('numero', isLessThanOrEqualTo: num)
        .snapshots();
  }
}
