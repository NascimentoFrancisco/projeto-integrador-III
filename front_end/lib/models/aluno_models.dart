
import 'dart:convert';

class Curso{
  int id;
  String titulo;
  String sigla;
  String turno;

  Curso({required this.id, required this.titulo, required this.sigla, required this.turno});

  Curso.fromJson(Map<String, dynamic> json)
   :id = json["id"],
    titulo = json["titulo"],
    sigla = json["sigla"],
    turno = json["turno"];
}

class User{
  int id;
  String cpf;
  String matricula;
  String email;
  String password = "";

  User({required this.id, required this.cpf, required this.matricula, required this.email});

  User.fromJson(Map<String, dynamic> json)
   :id = json["id"],
    cpf = json["cpf"],
    matricula = json["matricula"],
    email = json["email"];

}

class Aluno{

  int id;
  String nome;
  DateTime dataNascimento;
  Curso curso;
  User user;

  Aluno({
    required this.id, required this.nome, 
    required this.dataNascimento, 
    required this.curso, required this.user
  });
  
  Aluno.fromJson(Map<String, dynamic> json)
   :id = json["id"],
    nome = json["nome"],
    dataNascimento = DateTime.parse(json["data_nascimento"]),
    curso = json["curso"],
    user = json["user"];

}