// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alunologin.stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AlunoLoginStores on _AlunoLoginStores, Store {
  Computed<bool>? _$getClickLoginComputed;

  @override
  bool get getClickLogin =>
      (_$getClickLoginComputed ??= Computed<bool>(() => super.getClickLogin,
              name: '_AlunoLoginStores.getClickLogin'))
          .value;
  Computed<bool>? _$alunoLogadoComputed;

  @override
  bool get alunoLogado =>
      (_$alunoLogadoComputed ??= Computed<bool>(() => super.alunoLogado,
              name: '_AlunoLoginStores.alunoLogado'))
          .value;
  Computed<Map<String, dynamic>>? _$getTokensComputed;

  @override
  Map<String, dynamic> get getTokens => (_$getTokensComputed ??=
          Computed<Map<String, dynamic>>(() => super.getTokens,
              name: '_AlunoLoginStores.getTokens'))
      .value;

  late final _$mensagemAtom =
      Atom(name: '_AlunoLoginStores.mensagem', context: context);

  @override
  String get mensagem {
    _$mensagemAtom.reportRead();
    return super.mensagem;
  }

  @override
  set mensagem(String value) {
    _$mensagemAtom.reportWrite(value, super.mensagem, () {
      super.mensagem = value;
    });
  }

  late final _$clickLoginAtom =
      Atom(name: '_AlunoLoginStores.clickLogin', context: context);

  @override
  bool get clickLogin {
    _$clickLoginAtom.reportRead();
    return super.clickLogin;
  }

  @override
  set clickLogin(bool value) {
    _$clickLoginAtom.reportWrite(value, super.clickLogin, () {
      super.clickLogin = value;
    });
  }

  late final _$logadoAtom =
      Atom(name: '_AlunoLoginStores.logado', context: context);

  @override
  bool get logado {
    _$logadoAtom.reportRead();
    return super.logado;
  }

  @override
  set logado(bool value) {
    _$logadoAtom.reportWrite(value, super.logado, () {
      super.logado = value;
    });
  }

  late final _$tokensAtom =
      Atom(name: '_AlunoLoginStores.tokens', context: context);

  @override
  Map<String, dynamic> get tokens {
    _$tokensAtom.reportRead();
    return super.tokens;
  }

  @override
  set tokens(Map<String, dynamic> value) {
    _$tokensAtom.reportWrite(value, super.tokens, () {
      super.tokens = value;
    });
  }

  late final _$checkLoginAsyncAction =
      AsyncAction('_AlunoLoginStores.checkLogin', context: context);

  @override
  Future<bool> checkLogin() {
    return _$checkLoginAsyncAction.run(() => super.checkLogin());
  }

  late final _$apagaTokensAsyncAction =
      AsyncAction('_AlunoLoginStores.apagaTokens', context: context);

  @override
  Future<bool> apagaTokens() {
    return _$apagaTokensAsyncAction.run(() => super.apagaTokens());
  }

  late final _$efetuaLoginAsyncAction =
      AsyncAction('_AlunoLoginStores.efetuaLogin', context: context);

  @override
  Future<bool> efetuaLogin(String matricula, String password) {
    return _$efetuaLoginAsyncAction
        .run(() => super.efetuaLogin(matricula, password));
  }

  late final _$_AlunoLoginStoresActionController =
      ActionController(name: '_AlunoLoginStores', context: context);

  @override
  void setClickLogin(bool value) {
    final _$actionInfo = _$_AlunoLoginStoresActionController.startAction(
        name: '_AlunoLoginStores.setClickLogin');
    try {
      return super.setClickLogin(value);
    } finally {
      _$_AlunoLoginStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLogado(bool value) {
    final _$actionInfo = _$_AlunoLoginStoresActionController.startAction(
        name: '_AlunoLoginStores.setLogado');
    try {
      return super.setLogado(value);
    } finally {
      _$_AlunoLoginStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mensagem: ${mensagem},
clickLogin: ${clickLogin},
logado: ${logado},
tokens: ${tokens},
getClickLogin: ${getClickLogin},
alunoLogado: ${alunoLogado},
getTokens: ${getTokens}
    ''';
  }
}
