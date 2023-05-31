
import 'package:access_control/models/aluno.dart';

class Responsavel{

  int id;
  String nome;
  DateTime dataNascimento;
  User user;

  Responsavel({
    required this.id, required this.nome, 
    required this.dataNascimento, 
    required this.user
  });
  
  Responsavel.fromJson(Map<String, dynamic> json)
   :id = json["id"],
    nome = json["nome"],
    dataNascimento = DateTime.parse(json["data_nascimento"]),
    user = json["user"];

}