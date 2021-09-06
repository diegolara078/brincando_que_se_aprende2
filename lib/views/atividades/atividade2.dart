import 'package:brincando_que_se_aprende/controller/controller_atividades.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Atividade2 extends GetView<AtividadesController> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          //"BRINCANDO QUE SE APRENDE",
          "TESTE",
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Image.asset(
          //   "assets/images/infantil2.jpg",
          //   fit: BoxFit.cover,
          //   height: 1000.0,
          //   width: 1000.0,
          // ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: new Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    // children: [
                    //   Image.asset(
                    //     'assets/images/pista3Atividade.png',
                    //   ),
                    // ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Draggable(
                          data: 4,
                          child: Container(
                            width: 300,
                            height: 165,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/maças.jpg'),
                              ),
                            ),
                          ),
                          feedback: Container(
                            width: 300,
                            height: 165,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/maças.jpg'),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.all(70.0),
                              width: 100.0,
                              height: 100.0,
                              color: Colors.green,
                              child: DragTarget(
                                builder: (context, acceptedData, rejectedData) {
                                  //print(candidateData);
                                  return Center(
                                      child: Text(
                                    "Par",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22.0),
                                  ));
                                },
                                onWillAccept: (data) {
                                  return true;
                                },
                                onAccept: (data) {
                                  if (data == 4) {
                                    AlertDialog alert = AlertDialog(
                                      backgroundColor: Colors.blue,
                                      title: Row(
                                        children: [
                                          Text('PARABÉNS'),
                                          Image.asset(
                                            'assets/images/alertDiakig.png',
                                            width: 140,
                                            height: 100,
                                            fit: BoxFit.contain,
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        Text('GOSTOU DA ATIVIDADE'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(Icons.thumb_up,
                                                  color: Colors.greenAccent,
                                                  size: 24.0),
                                              onPressed: () {},
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.thumb_down,
                                                color: Colors.redAccent,
                                                size: 24.0,
                                              ),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return alert;
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                            Container(
                              width: 100.0,
                              height: 100.0,
                              color: Colors.deepPurple,
                              child: DragTarget(
                                onAccept: (data) {
                                  scaffoldKey.currentState!.showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Tente novamente você consegue")));
                                },
                                builder: (context, acceptedData, rejectedData) {
                                  return Center(
                                      child: Text(
                                    "Impar",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22.0),
                                  ));
                                },
                                onWillAccept: (data) {
                                  return true;
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
