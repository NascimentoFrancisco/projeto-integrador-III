import 'dart:convert';
import 'package:app_guardinha/models/guarda.dart';
import 'package:app_guardinha/models/user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'guarda.stores.g.dart';


// ignore: library_private_types_in_public_api
class GuardaStores = _GuardaStores with _$GuardaStores;

abstract class _GuardaStores with Store{

  String urlRoot = dotenv.get('API_ROOT_URL');

  @observable
  String mensagem = "";

  @action
  void limpaMensagem(){
    mensagem = "";
  }

  /* Dados QrCode enviados */
  @observable
  bool dadosEnviados = false;

  @computed
  bool get getdadosEnviados => dadosEnviados;

  @action
  void setdadosEnviados(bool value){
    dadosEnviados = value;
  }
  /* Dados QrCode enviados */

  /* Cliques em botões */
  @observable
  bool clicado = false;

  @computed
  bool get getClicado => clicado;

  @action
  void setClicado(bool value){
    clicado = value;
  }
  /* Cliques em botões */

  /* Classes Guarda e User */
  @observable
  Guarda? guarda;

  @observable
  User? user;
  /* Classes Guarda e User */


  /* Tokens */
  @observable
  Map <String, dynamic> tokens = {"access":"", "refresh":""};

  @computed
  Map<String, dynamic> get getTokens => tokens;
  /* Tokens */


  @action//Função que busca o token do aluno para validar se o mesmoestá logado
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens["access"] = prefs.getString('accessToken');
    tokens["refresh"] = prefs.getString('refreshToken');  
    
    if (tokens["access"] != null && tokens["access"].toString().isNotEmpty){
      return true;
    }
    return false;
  }

  @action
  Future<void> salvaTokens(String? access, String? refresh) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (access != null){
      await prefs.setString('accessToken', access);
    }
    if (refresh != null){
      await prefs.setString('refreshToken', refresh);
    }    
  }

  @action
  Future<bool> efetuaLogin(String cpf, String password) async {
    
    if (cpf.isEmpty || password.isEmpty){
      mensagem = "Os campos de login não podem ser vazios!";
      return false;
    }
      
    String url = "$urlRoot/api/token/";
    var body = {"cpf": cpf, "password": password};
    http.Response response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 200){
      
      var responseData = json.decode(utf8.decode(response.bodyBytes));
      await salvaTokens(responseData["access"], responseData["refresh"]);
      return true;

    } else if(response.statusCode == 401){        
      mensagem = "Credenciais erradas";
      return false;
    }else{
      mensagem = "Algo deu errado!";
      return false;
    }
  }

  @action//Apgando tokens, função chamada para logout do usuário
  Future<bool> apagaTokens()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    tokens.clear();
    return true;
  }

  @action
  Future<void> atualizaTokenAccess()async{

    String url = "$urlRoot/api/token/refresh/";
    var body = {"refresh": getTokens["refresh"]};
    http.Response response = await http.post(Uri.parse(url), body: body);
    
    if (response.statusCode == 200){
      
      var responsejson = json.decode(response.body);
      await salvaTokens(responsejson['access'], null);
    
    }else{
      mensagem = "Algo deu errado!";
    }
  }


  @action
  Future<void> getGuarda(Map<String, dynamic> tokens) async{
    
    String url = "$urlRoot/guarda-get/";
    var headers={"Authorization": "Bearer ${tokens['access']}"};
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    
    try{
      var responseData = json.decode(utf8.decode(response.bodyBytes));
      user = User.fromJson(responseData[0]["user"]);

      guarda = Guarda(
        id: responseData[0]["id"], 
        nome: responseData[0]["nome"], 
        dataNascimento: DateTime.parse(responseData[0]["data_nascimento"]),
        user: user!,
      );
    } on RangeError{
      mensagem = "Nenhum servidor encontrado com esse CPF!";    
    }
    
  }

  @action
  Future<bool> mudarSenha(String senhaAntiga, String senha, String confirmaSenha)async{
    if (senhaAntiga.isEmpty || senha.isEmpty || confirmaSenha.isEmpty){
      mensagem = "Nenhum dos campos podem ser vazios!";
      return false;

    } else{
      await atualizaTokenAccess();

      String urlChange = "$urlRoot/change_password/${guarda!.user.id}/";
      Map<String, dynamic> dados = {
        "old_password": senhaAntiga, 
        "password": senha,
        "password2": confirmaSenha
      };
    
      Map<String, String> headers ={"Authorization": "Bearer ${getTokens['access']}"};
      http.Response response = await http.put(
        Uri.parse(urlChange), headers: headers, body: dados 
      );
      
      if (response.statusCode == 200){
        mensagem = "Senha alterada com sucesso!";
        return true;

      }else if (response.statusCode == 400){
        var erro = json.decode(utf8.decode(response.bodyBytes));
        
        try{
          mensagem = erro['old_password']['old_password'];
        } on NoSuchMethodError {
          mensagem = erro['password'][0];
        }
      }
    }
    return false;
  }


  @action
  Future<bool> enviaEmailRedefenirSenha(String email)async{
    if (email.isEmpty){
      mensagem = "Campo de email vazio, insira um email.";
      return false;
    }else{

      String urlEnviaEmail = "$urlRoot/reset-password/";
      var body = {"email": email};
      http.Response response = await http.post(Uri.parse(urlEnviaEmail), body: body);
      var responseJason = json.decode(utf8.decode(response.bodyBytes));

      if(response.statusCode == 200){
        mensagem = responseJason["detail"];
        return true;
      } else if (response.statusCode == 400){
        mensagem = responseJason["detail"];
        return false;
      }
    }
    return false;
  }

  @action
  Future<void> enviaDadosQrCode(String dados) async{

    mensagem = "";
    
    Map<String, dynamic> dadosJson = jsonDecode(dados);
    String url = "$urlRoot/create/historico/";
    var body = {"tipo_movimentacao": dadosJson["Tipo"], "token": dadosJson["Token"]};
    http.Response response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 201){
      mensagem = "Dados enviados!";
      setdadosEnviados(true);
    } else{
      var responseJason = json.decode(utf8.decode(response.bodyBytes));
      mensagem = responseJason["Error"];
      setdadosEnviados(false);
    }

  }

}