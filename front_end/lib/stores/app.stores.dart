import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app.stores.g.dart';


// ignore: library_private_types_in_public_api
class AppStores = _AppStores with _$AppStores;

abstract class _AppStores with Store {

  String urlRoot = dotenv.get('API_ROOT_URL');

  @observable
  bool userResponsavel = false;

  @computed
  bool get getUserResponsavel => userResponsavel;

  @observable
  bool clicked = false;

  @action
  void setUserResponsavel(bool value){
    userResponsavel = value;
  }

  @action
  Future<void> atualizaUserTipo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString('user');

    if (user != null && user == 'aluno'){
      await setAluno();
    }else if (user != null && user == 'responsavel'){
      await setResponsavel();
    }
  }

  @action
  Future<void> setAluno() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', "aluno");
    setUserResponsavel(false);
  }

  @action
  Future<void>setResponsavel() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', "responsavel");
    setUserResponsavel(true);
  }

  @action
  void setClicked(){
    clicked = !clicked;
  }

  @computed
  bool get getClicked => clicked;

}