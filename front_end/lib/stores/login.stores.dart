import 'dart:convert';
import 'package:access_control/models/aluno_models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'login.stores.g.dart';

// ignore: library_private_types_in_public_api
class LoginStores = _LoginStores with _$LoginStores;

abstract class _LoginStores with Store {

  String urlRoot = dotenv.get('API_ROOT_URL');

  @observable //Variável que valida se o token está salvo ou não.
  bool isLoggedIn = false;

  @observable
  bool login = false;

  @observable
  bool senhaMudada = false;

  @observable
  bool clicked = false;

  @observable 
  String? token;

  @observable
  String messege = "";

  @action
  void setClicked(){
    clicked = !clicked;
  }

  @computed
  bool get getClicked => clicked;

  @action
  Future<bool> checkLogin() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    if (token != null && token!.isNotEmpty){
      isLoggedIn = true;
      salvaToken(token!);
      
    } else{
      isLoggedIn = false;
      
    }
    return isLoggedIn;
  }

  void salvaToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String> pegaToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    return token.toString();
  }

  @action
  Future<bool> efetuaLogin(String username, String password) async {

    setClicked();

    if (username.isEmpty || password.isEmpty){
      
      login = false;
      messege = "Os campos de login não podem ser vazios!";
      setClicked();

    }else{
      
      String url = "$urlRoot/api-token-auth/";
      var body = {"username": username, "password": password};
      http.Response response = await http.post(Uri.parse(url), body: body);
    
      if (response.statusCode == 200){
        
        var responseData = json.decode(utf8.decode(response.bodyBytes));
        salvaToken(responseData["token"]);
        token = responseData["token"].toString();
        setClicked();
        login = true;

      } else if(response.statusCode == 400){
        
        messege = "Credenciais erradas";
        login = false;
        setClicked();

      }else{

        messege = "Algo deu errado!";
        login = false;
        setClicked();

      }
    }
    return login;
  }

  @action
  Future<bool> sairLogin()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    token = "";
    login = false;

    return login;
  }


  Future<void> mudaSenha(String senhaAntiga, String senha, String confirmaSenha, Aluno aluno, String token)async{
    
    senhaMudada = false;
    messege = "";
    setClicked();

    if (senhaAntiga.isEmpty || senha.isEmpty || confirmaSenha.isEmpty){
      messege = "Nenhum dos campos podem ser vazios!";
      senhaMudada = false;
      setClicked();
    } else{
      String urlChange = "$urlRoot/change_password/${aluno.user.id}/";
      Map<String, dynamic> dados = {
        "old_password": senhaAntiga, 
        "password": senha,
        "password2": confirmaSenha
      };
    
      Map<String, String> headers ={"Authorization": "Token $token"};

      http.Response response = await http.put(
        Uri.parse(urlChange), headers: headers, body: dados 
      );

      var erro;

      if (response.statusCode == 200){
        senhaMudada = true;
        setClicked();
        messege = "Senha alterada com sucesso!";
      }else if (response.statusCode == 400){
        senhaMudada = false;
        setClicked();
        erro = json.decode(utf8.decode(response.bodyBytes));
        
        try{
          messege = erro['old_password']['old_password'];
        } on NoSuchMethodError {
          messege = erro['password'][0];
        }
      }
    }
  }
}