import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late final String? id;
  late final String? name;
  late final String? email;
  late final String? atividade;

  UserModel({this.id, this.name, this.email, this.atividade});

  UserModel.fromMap(DocumentSnapshot<Object?> data) {
    id = data.id;
    name = data["name"];
    email = data["email"];
    atividade = data["atividade"];
  }

  UserModel.fromSnapshot(DocumentSnapshot<Object?> snapshot) {
    name = snapshot["name"];
    email = snapshot["email"];
    atividade = snapshot["atividade"];
    id = snapshot.id;
  }
}
