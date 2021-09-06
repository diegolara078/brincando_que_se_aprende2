import 'package:brincando_que_se_aprende/controller/controller_home.dart';
import 'package:brincando_que_se_aprende/widgets/CustomButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListitensWidget extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  final atividade;
  ListitensWidget({Key? key, required this.atividade}) : super(key: key);
  //final HomeController controllerHome = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: controller.getAllProducts3(atividade),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return Padding(
              padding: EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 90, height: 60),
                child: CustomButton(
                  onPressed: () {
                    Get.toNamed("/Historias", arguments: {
                      "imagemGif": data['imagemGif'].toString(),
                      "imagemPista": data['imagemPista'].toString(),
                      "numero": data['numero'].toString(),
                      "id": Get.arguments['id'].toString(),
                    });
                  },
                  //text: data['numero'].toString() + "º " + data['texto'],
                  text: data['numero'].toString() + "º ",
                  color: Colors.blueAccent,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
