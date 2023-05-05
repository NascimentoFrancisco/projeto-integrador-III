// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStores on _LoginStores, Store {
  Computed<String>? _$getTipoComputed;

  @override
  String get getTipo => (_$getTipoComputed ??=
          Computed<String>(() => super.getTipo, name: '_LoginStores.getTipo'))
      .value;
  Computed<bool>? _$getClickedComputed;

  @override
  bool get getClicked =>
      (_$getClickedComputed ??= Computed<bool>(() => super.getClicked,
              name: '_LoginStores.getClicked'))
          .value;

  late final _$isLoggedInAtom =
      Atom(name: '_LoginStores.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$loginAtom = Atom(name: '_LoginStores.login', context: context);

  @override
  bool get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(bool value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  late final _$senhaMudadaAtom =
      Atom(name: '_LoginStores.senhaMudada', context: context);

  @override
  bool get senhaMudada {
    _$senhaMudadaAtom.reportRead();
    return super.senhaMudada;
  }

  @override
  set senhaMudada(bool value) {
    _$senhaMudadaAtom.reportWrite(value, super.senhaMudada, () {
      super.senhaMudada = value;
    });
  }

  late final _$clickedAtom =
      Atom(name: '_LoginStores.clicked', context: context);

  @override
  bool get clicked {
    _$clickedAtom.reportRead();
    return super.clicked;
  }

  @override
  set clicked(bool value) {
    _$clickedAtom.reportWrite(value, super.clicked, () {
      super.clicked = value;
    });
  }

  late final _$tokenAtom = Atom(name: '_LoginStores.token', context: context);

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$messegeAtom =
      Atom(name: '_LoginStores.messege', context: context);

  @override
  String get messege {
    _$messegeAtom.reportRead();
    return super.messege;
  }

  @override
  set messege(String value) {
    _$messegeAtom.reportWrite(value, super.messege, () {
      super.messege = value;
    });
  }

  late final _$tipoAtom = Atom(name: '_LoginStores.tipo', context: context);

  @override
  String get tipo {
    _$tipoAtom.reportRead();
    return super.tipo;
  }

  @override
  set tipo(String value) {
    _$tipoAtom.reportWrite(value, super.tipo, () {
      super.tipo = value;
    });
  }

  late final _$checkLoginAsyncAction =
      AsyncAction('_LoginStores.checkLogin', context: context);

  @override
  Future<bool> checkLogin() {
    return _$checkLoginAsyncAction.run(() => super.checkLogin());
  }

  late final _$efetuaLoginAsyncAction =
      AsyncAction('_LoginStores.efetuaLogin', context: context);

  @override
  Future<bool> efetuaLogin(String username, String password) {
    return _$efetuaLoginAsyncAction
        .run(() => super.efetuaLogin(username, password));
  }

  late final _$sairLoginAsyncAction =
      AsyncAction('_LoginStores.sairLogin', context: context);

  @override
  Future<bool> sairLogin() {
    return _$sairLoginAsyncAction.run(() => super.sairLogin());
  }

  late final _$_LoginStoresActionController =
      ActionController(name: '_LoginStores', context: context);

  @override
  void setTipo(String value) {
    final _$actionInfo = _$_LoginStoresActionController.startAction(
        name: '_LoginStores.setTipo');
    try {
      return super.setTipo(value);
    } finally {
      _$_LoginStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setClicked() {
    final _$actionInfo = _$_LoginStoresActionController.startAction(
        name: '_LoginStores.setClicked');
    try {
      return super.setClicked();
    } finally {
      _$_LoginStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoggedIn: ${isLoggedIn},
login: ${login},
senhaMudada: ${senhaMudada},
clicked: ${clicked},
token: ${token},
messege: ${messege},
tipo: ${tipo},
getTipo: ${getTipo},
getClicked: ${getClicked}
    ''';
  }
}
