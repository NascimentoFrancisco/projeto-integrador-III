import 'dart:convert';
import 'package:access_control/models/responsavel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import '../models/aluno.dart';


part 'responsavel.stores.g.dart';

// ignore: library_private_types_in_public_api
class ResponsavelStores = _ResponsavelStores with _$ResponsavelStores;

abstract class _ResponsavelStores with Store {

  String urlRoot = dotenv.get('API_ROOT_URL');

  @observable
  bool clickedBotao = false;

  @observable
  Responsavel? responsavel;

  @observable
  User? user;

  @observable/* Lista de alunos desse responsável */
  List<Aluno> listaAlunos = [];

  @observable
  List<HistoricoAluno> listHistoricoAluno = [];

  @observable
  String mensagem = "";

  @action
  void limpaListaalunos(){
    listaAlunos.clear();
  }

  @action
  void setClickedBotao(bool value){
    clickedBotao = value;
  }

  @computed
  bool get getClickedBotao => clickedBotao;

  @action
  Future<void> getResponsavel(Map<String, dynamic> tokens) async{
    
    String url = "$urlRoot/responsavel-list/";
    var headers={"Authorization": "Bearer ${tokens['access']}"};
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    

    try{
      var responseData = json.decode(utf8.decode(response.bodyBytes));
      user = User.fromJson(responseData[0]["user"]);

      responsavel = Responsavel(
        id: responseData[0]["id"], 
        nome: responseData[0]["nome"], 
        dataNascimento: DateTime.parse(responseData[0]["data_nascimento"]),
        user: user!,
      );
    } on RangeError{
      mensagem = "Nenhum resposável encontrado com esse CPF!";    
    }
    
  }

  @action
  Future<void> getAlunoResponsavel(Map<String, dynamic> tokens) async{
  
    limpaListaalunos();

    String url = "$urlRoot/aluno-responsavel/${responsavel!.id}/";
    var headers={"Authorization": "Bearer ${tokens['access']}"};
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    
    List<dynamic> responseData = json.decode(utf8.decode(response.bodyBytes));

    for (var element in responseData) { 
      Curso curso = Curso.fromJson(element["curso"]);
      User userAluno = User.fromJson(element["user"]);
      Aluno aluno = Aluno(
        id: element["id"], 
        nome: element["nome"], 
        dataNascimento: DateTime.parse(element["data_nascimento"]),
        curso: curso,
        user: userAluno,
      );
      listaAlunos.add(aluno);
    }
  }

  @action
  Future<void> getHistoricoAluno(Map<String, dynamic> tokens, Aluno aluno)async{
    
    listHistoricoAluno.clear();

    String url = "$urlRoot/historico/${aluno.id}/";
    var headers={"Authorization": "Bearer ${tokens['access']}"};
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    List<dynamic> responseData = json.decode(utf8.decode(response.bodyBytes));
   
    for (var element in responseData) {
      AlunoParaHistorico aluno = AlunoParaHistorico.fromJson(element["aluno"]);
      HistoricoAluno historico = HistoricoAluno(
        id: element["id"],
        criadoEm: DateTime.parse(element["criado_em"]),
        tipoMovimentacao: element["tipo_movimentacao"],
        aluno: aluno
      );
      listHistoricoAluno.add(historico);       
    }
  }

}