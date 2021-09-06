import 'package:brincando_que_se_aprende/controller/controller_home.dart';
import 'package:brincando_que_se_aprende/controller/controller_login.dart';
import 'package:brincando_que_se_aprende/custom_text.dart';
import 'package:brincando_que_se_aprende/views/home/listItens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuAtividades extends StatelessWidget {
  //final HomeController controllerHome = Get.put(HomeController());
  //final LoginController controller = Get.put(LoginController());
  final LoginController controller = Get.find<LoginController>();
  final HomeController controllerHome = Get.find<HomeController>();
  //final HomeController controllerHome = Get.find<HomeController>();

  void _signOut() {
    controller.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: CustomText(
          //text: "Vamos ajudar Alice",
          text: "Teste",
          size: 24,
          weight: FontWeight.bold,
          color: Colors.black,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.brush_sharp),
              onPressed: () {
                // showBarModalBottomSheet(
                //   context: context,
                //   builder: (context) => Container(
                //     color: Colors.white,
                //     child: ShoppingCartWidget(),
                //   ),
                // );
              })
        ],
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: [
            Obx(() => UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                accountName: Text(controllerHome.userModel.value.name ?? ""),
                accountEmail:
                    Text(controllerHome.userModel.value.email ?? ""))),
            ListTile(
              leading: Icon(Icons.book),
              title: CustomText(
                text: "teste",
                size: 24,
                weight: FontWeight.bold,
                color: Colors.black,
              ),
              onTap: () async {
                //paymentsController.getPaymentHistory();
              },
            ),
            ListTile(
              onTap: () {
                _signOut();
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Log out"),
            )
          ],
        ),
      ),
      //body: ListitensWidget(),

      body: Obx(() =>
          ListitensWidget(atividade: controllerHome.userModel.value.atividade)),
    );
  }
}
