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
  Future<void> getAluno(String token) async{
    
    String url = "http://10.0.0.15:8000/aluno-list/";

    var headers={"Authorization": "Token ${token}"};

    http.Response response = await http.get(Uri.parse(url),headers: headers);

    var responseData = json.decode(utf8.decode(response.bodyBytes));
    
    curso = Curso.fromJson(responseData[0]["curso"]);
    user = User.fromJson(responseData[0]["user"]);

    aluno = Aluno(
      id: responseData[0]["id"], 
      nome: responseData[0]["nome"], 
      dataNascimento: DateTime.parse(responseData[0]["data_nascimento"]),
      curso: curso!,
      user: user!,
    );

  }
}


