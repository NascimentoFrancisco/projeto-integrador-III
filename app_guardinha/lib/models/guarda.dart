
import 'package:app_guardinha/models/user.dart';

class Guarda{

  int id;
  String nome;
  DateTime dataNascimento;
  User user;

  Guarda({
    required this.id, required this.nome, 
    required this.dataNascimento, 
    required this.user
  });
  
  Guarda.fromJson(Map<String, dynamic> json)
   :id = json["id"],
    nome = json["nome"],
    dataNascimento = DateTime.parse(json["data_nascimento"]),
    user = json["user"];

}