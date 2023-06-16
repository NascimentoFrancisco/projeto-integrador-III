import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/aluno.dart';
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

  @observable
  bool alunoInstanciado = false;

  @action
  void setalunoInstanciado(bool value){
    alunoInstanciado = value;
  }

  @computed
  bool get getalunoInstanciado => alunoInstanciado;

  @computed
  bool get getIsClicked => isClicked;

  @observable
  String mensagem = "";
  
  @action
  Future<void> getAluno(Map<String, dynamic> tokens) async{
    
    String url = "$urlRoot/aluno-list/";
    var headers={"Authorization": "Bearer ${tokens['access']}"};
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    
    var responseData = json.decode(utf8.decode(response.bodyBytes));
    
    try{
      curso = Curso.fromJson(responseData[0]["curso"]);
      user = User.fromJson(responseData[0]["user"]);
      aluno = Aluno(
        id: responseData[0]["id"], 
        nome: responseData[0]["nome"], 
        dataNascimento: DateTime.parse(responseData[0]["data_nascimento"]),
        curso: curso!,
        user: user!,
      );
      setalunoInstanciado(true);
    } on RangeError{
      mensagem = "Nenhum aluno encontrado com esse CPF";
    }
        
  }
}