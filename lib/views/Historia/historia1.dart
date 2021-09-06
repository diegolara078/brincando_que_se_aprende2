import 'package:audioplayers/audioplayers.dart';
//import 'package:brincando_que_se_aprende/views/atividades/atividade1.dart';
import 'package:brincando_que_se_aprende/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Historias extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<Historias> {
  String imagemPista = Get.arguments['imagemPista'];
  String imageGif = Get.arguments['imagemGif'];
  String numero = Get.arguments['numero'];
  String id = Get.arguments['id'];

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  bool primeiraExecucao = true;
  bool iniciaAudio = true;
  _executar() async {
    if (iniciaAudio) {
      audioPlayer =
          await audioCache.play('sons/' + 'Atividade' + numero + '.m4a');
      iniciaAudio = false;
    }
    if (primeiraExecucao) {
      primeiraExecucao = false;
      await audioPlayer.resume();
      print("sim");
    } else {
      print("sim 2");
      primeiraExecucao = true;
      await audioPlayer.pause();
    }
  }

  _parar() async {
    await audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    _executar();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "BRINCANDO QUE SE APRENDE",
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: criaStack(),
    );
  }

  criaStack() {
    return Stack(
      children: [
        // Image.asset(
        //   "assets/images/" + imagemPista,
        //   fit: BoxFit.cover,
        //   height: 1000.0,
        // ),
        SingleChildScrollView(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              // GestureDetector(
              //   child: Image.asset("assets/images/Play.png"),
              //   onTap: () {
              //     _executar();
              //   },
              // ),
              // Image.asset(
              //   //'assets/images/' + widget.imageGif,
              //   'assets/images/' + imageGif,
              //   width: 300,
              //   height: 230,
              //   fit: BoxFit.scaleDown,
              // ),
              // Image.asset(
              //   'assets/images/' + 'pista' + numero + '.png',
              //   width: 400,
              //   height: 120,
              //   fit: BoxFit.scaleDown,
              // ),
              Padding(
                padding: EdgeInsets.all(10),
                child: CustomButton(
                  text: "AJUDAR ALICE",
                  color: Colors.blueAccent,
                  onPressed: () {
                    _parar();
                    Get.toNamed("/Atividade" + numero, arguments: {
                      "id": id,
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
