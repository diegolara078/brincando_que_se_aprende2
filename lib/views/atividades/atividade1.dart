import 'package:brincando_que_se_aprende/controller/controller_atividades.dart';
import 'package:brincando_que_se_aprende/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Atividade1 extends GetView<AtividadesController> {
  //final Atividade1 controllers = Get.find<Atividade1>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          //"BRINCANDO QUE SE APRENDE",
          "teste",
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("assets/images/infantil2.jpg"),
            //   fit: BoxFit.cover,
            // ),
            ),
        padding: EdgeInsets.all(30),
        child: Form(
          key: controller.validaFormKey,
          child: Column(
            children: [
              SizedBox(
                child: new Wrap(
                  children: [
                    // Image.asset(
                    //   'assets/images/pista1Atividade.png',
                    // ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 300,
                    height: 130,
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //     image: AssetImage('assets/images/mapa.png'),
                    //   ),
                    // ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(labelText: 'Nome da imagem'),
                  controller: controller.texto1,
                  validator: (value) {
                    return controller.validateTexto1(value!);
                  },
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 300,
                    height: 130,
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //     image: AssetImage('assets/images/gato.png'),
                    //   ),
                    // ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(labelText: 'Nome da imagem'),
                  controller: controller.texto2,
                  validator: (value) {
                    return controller.validateTexto2(value!);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: CustomButton(
                  //text: "AJUDAR ALICE",
                  text: "Submit",
                  color: Colors.blueAccent,
                  onPressed: () {
                    controller.checkLogin(2);
                    //Get.toNamed("/menuAtividades");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
