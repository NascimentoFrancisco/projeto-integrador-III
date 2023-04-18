import 'dart:convert';
import 'package:access_control/models/aluno_models.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'login.stores.g.dart';

class LoginStores = _LoginStores with _$LoginStores;

abstract class _LoginStores with Store {

  @observable //Variável que valida se o token está salvo ou não.
  bool isLoggedIn = false;

  @observable
  bool login = false;

  @observable 
  String? token;

  @observable
  String messege = "";

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

    String url = "http://10.0.0.15:8000/api-token-auth/";

    var body = {"username": username, "password": password};

    http.Response response = await http.post(Uri.parse(url), body: body);
    
    if (response.statusCode == 200){
      var responseData = json.decode(utf8.decode(response.bodyBytes));
      salvaToken(responseData["token"]);
      login = true;

    } else if(response.statusCode == 400){
      messege = "Credenciais erradas";
      login = false;

    }else{
      messege = "Algo deu errado!";
      login = false;
    }
    return login;
  }

  @action
  Future<bool> sairLogin()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    login = false;

    return login;
  }


}