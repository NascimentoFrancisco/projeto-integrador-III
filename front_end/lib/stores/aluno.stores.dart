import 'dart:convert';
import 'package:access_control/models/aluno_models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'aluno.stores.g.dart';

// ignore: library_private_types_in_public_api
class AlunoStores = _AlunoStores with _$AlunoStores;

abstract class _AlunoStores with Store {

  String urlRoot = dotenv.get('API_ROOT_URL');
  
  @observable
  Curso? curso;

  @observable
  User? user;

  @observable
  Aluno? aluno;

  @observable
  bool isClicked = false;

  @computed
  bool get getIsClicked => isClicked;


  @action
  Future<void> getAluno(String token) async{
    
    String url = "$urlRoot/aluno-list/";

    var headers={"Authorization": "Token $token"};

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


