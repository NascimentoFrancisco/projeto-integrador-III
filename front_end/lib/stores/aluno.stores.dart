import 'dart:convert';
import 'package:access_control/models/aluno_models.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'aluno.stores.g.dart';

class AlunoStores = _AlunoStores with _$AlunoStores;

abstract class _AlunoStores with Store {

  @observable
  Curso? curso;

  @observable
  User? user;

  @observable
  Aluno? aluno;


  @action
  Future<void> getAluno() async{
    
    String url = "http://10.0.0.15:8000/alunos/1/";

    http.Response response = await http.get(Uri.parse(url));

    var responseData = json.decode(utf8.decode(response.bodyBytes));
    
    curso = Curso.fromJson(responseData["curso"]);
    user = User.fromJson(responseData["user"]);

    aluno = Aluno(
      id: responseData["id"], 
      nome: responseData["nome"], 
      dataNascimento: DateTime.parse(responseData["data_nascimento"]),
      curso: curso!,
      user: user!,
    );

  }
}


