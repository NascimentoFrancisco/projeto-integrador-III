import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/aluno.dart';


part 'alunologin.stores.g.dart';

// ignore: library_private_types_in_public_api
class AlunoLoginStores = _AlunoLoginStores with _$AlunoLoginStores;

abstract class _AlunoLoginStores with Store {

  String urlRoot = dotenv.get('API_ROOT_URL');

  //Variáveis auxiliares
  @observable//Variável usada para mensagens ao usuário, por exemplo mensagem de erro de login
  String mensagem = "";

  @observable
  bool clickLogin = false;

  @action
  void setClickLogin(bool value){
    clickLogin = value;
  }

  @computed
  bool get getClickLogin => clickLogin;

  @observable //Variável para verificar se o aluno está logado
  bool logado = false;

  @action
  void setLogado(bool value){
    logado = value;
  }

  @computed
  bool get alunoLogado => logado;

  @observable//Variável para definir se o QrCode é de entrada ou saída da instituição.
  String tipoQrCode = "";

  @action
  void setTipoQrcode(String value){
    tipoQrCode = value;
  }

  @computed
  String get getTipoQrCode => tipoQrCode;

  //Map de tokens(access e refresh)
  @observable
  Map <String, dynamic> tokens = {"access":"", "refresh":""};

  @computed
  Map<String, dynamic> get getTokens => tokens;
 
  @action//Função que busca o token do aluno para validar se o mesmoestá logado
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens["access"] = prefs.getString('access');
    tokens["refresh"] = prefs.getString('refresh');  
    
    if (tokens["access"] != null && tokens["access"].toString().isNotEmpty){
      setLogado(true);
    }

    return alunoLogado;
  }

  //Salvando tokens, somente se não nulos
  Future<void> salvaTokens(String? access, String? refresh) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (access != null){
      await prefs.setString('access', access);
    }

    if (refresh != null){
      await prefs.setString('refresh', refresh);
    }    
  }

  @action//Apgando tokens, função chamada para logout do usuário
  Future<bool> apagaTokens()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    tokens.clear();
    setLogado(false);
    return logado;
  }

  @action// Função que faz login diretamente na API
  Future<bool> efetuaLogin(String cpf, String password) async {
    setClickLogin(true);
    if (cpf.isEmpty || password.isEmpty){
      mensagem = "Os campos de login não podem ser vazios!";
    }else{      
      String url = "$urlRoot/api/token/";
      var body = {"cpf": cpf, "password": password};
      http.Response response = await http.post(Uri.parse(url), body: body);
    
      if (response.statusCode == 200){
        var responseData = json.decode(utf8.decode(response.bodyBytes));
        await salvaTokens(responseData["access"], responseData["refresh"]);
        setLogado(true);
      } else if(response.statusCode == 401){        
        mensagem = "Credenciais erradas";
      }else{
        mensagem = "Algo deu errado!";
      }
    }
    setClickLogin(false);
    return alunoLogado;
  }

  Future<void> atualizaTokenAccess()async{
    String url = "$urlRoot/api/token/refresh/";
    var body = {"refresh": getTokens["refresh"]};
    http.Response response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200){
      var responsejson = json.decode(response.body);
      salvaTokens(responsejson['access'], null);
    }else{
      mensagem = "Algo deu errado!";
    }
  }

  Future<bool> mudaSenha(String senhaAntiga, String senha, String confirmaSenha, Aluno aluno)async{
    if (senhaAntiga.isEmpty || senha.isEmpty || confirmaSenha.isEmpty){
      mensagem = "Nenhum dos campos podem ser vazios!";
      setClickLogin(false);
      return false;
    } else{
      await atualizaTokenAccess();

      String urlChange = "$urlRoot/change_password/${aluno.user.id}/";
      Map<String, dynamic> dados = {
        "old_password": senhaAntiga, 
        "password": senha,
        "password2": confirmaSenha
      };
    
      Map<String, String> headers ={"Authorization": "Bearer ${getTokens['access']}"};
      http.Response response = await http.put(
        Uri.parse(urlChange), headers: headers, body: dados 
      );
      // ignore: prefer_typing_uninitialized_variables
      var erro;
      
      if (response.statusCode == 200){
        mensagem = "Senha alterada com sucesso!";
        setClickLogin(false);
        return true;
      }else if (response.statusCode == 400){
        erro = json.decode(utf8.decode(response.bodyBytes));
        try{
          mensagem = erro['old_password']['old_password'];
        } on NoSuchMethodError {
          mensagem = erro['password'][0];
        }
      }
    }
    setClickLogin(false);
    return false;
  }


  Future<bool> enviaEmailRedefenirSenha(String email)async{
    if (email.isEmpty){
      mensagem = "Campo de email vazio, insira um email.";
      setClickLogin(false);
      return false;
    }else{
      String urlEnviaEmail = "$urlRoot/reset-password/";
      var body = {"email": email};
      http.Response response = await http.post(Uri.parse(urlEnviaEmail), body: body);
      var responseJason = json.decode(utf8.decode(response.bodyBytes));

      if(response.statusCode == 200){
        mensagem = responseJason["detail"];
        setClickLogin(false);
        return true;
      } else if (response.statusCode == 400){
        mensagem = responseJason["detail"];
        setClickLogin(false);
        return false;
      }
    }
    return false;
  }
}