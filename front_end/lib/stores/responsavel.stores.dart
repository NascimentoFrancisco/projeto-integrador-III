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
  Responsavel? responsavel;

  @observable
  User? user;

  @action
  Future<void> getResponsavel(Map<String, dynamic> tokens) async{
    
    String url = "$urlRoot/responsavel-list/";
    var headers={"Authorization": "Bearer ${tokens['access']}"};
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    
    var responseData = json.decode(utf8.decode(response.bodyBytes));
  
    user = User.fromJson(responseData[0]["user"]);

    responsavel = Responsavel(
      id: responseData[0]["id"], 
      nome: responseData[0]["nome"], 
      dataNascimento: DateTime.parse(responseData[0]["data_nascimento"]),
      user: user!,
    );

  }

}