import 'package:cloud_firestore/cloud_firestore.dart';

class MenuModel {
  late final String? id;
  late final String? imagemGif;
  late final String? imagemPista;
  late final String? numero;
  late final String? texto;

  MenuModel(
      {this.id, this.imagemGif, this.imagemPista, this.numero, this.texto});

  MenuModel.fromMap(DocumentSnapshot<Object?> data) {
    id = data.id;
    imagemGif = data["imagemGif"];
    imagemPista = data["email"];
    numero = data["numero"];
    texto = data["texto"];
  }

  MenuModel.fromSnapshot(DocumentSnapshot<Object?> snapshot) {
    imagemGif = snapshot["name"];
    imagemPista = snapshot["email"];
    numero = snapshot["numero"];
    texto = snapshot["texto"];
    id = snapshot.id;
  }
}
