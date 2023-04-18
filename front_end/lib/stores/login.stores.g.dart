// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStores on _LoginStores, Store {
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

  @override
  String toString() {
    return '''
isLoggedIn: ${isLoggedIn},
login: ${login},
token: ${token},
messege: ${messege}
    ''';
  }
}
