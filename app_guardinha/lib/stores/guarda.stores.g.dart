// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guarda.stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GuardaStores on _GuardaStores, Store {
  Computed<bool>? _$getdadosEnviadosComputed;

  @override
  bool get getdadosEnviados => (_$getdadosEnviadosComputed ??= Computed<bool>(
          () => super.getdadosEnviados,
          name: '_GuardaStores.getdadosEnviados'))
      .value;
  Computed<bool>? _$getClicadoComputed;

  @override
  bool get getClicado =>
      (_$getClicadoComputed ??= Computed<bool>(() => super.getClicado,
              name: '_GuardaStores.getClicado'))
          .value;
  Computed<Map<String, dynamic>>? _$getTokensComputed;

  @override
  Map<String, dynamic> get getTokens => (_$getTokensComputed ??=
          Computed<Map<String, dynamic>>(() => super.getTokens,
              name: '_GuardaStores.getTokens'))
      .value;

  late final _$mensagemAtom =
      Atom(name: '_GuardaStores.mensagem', context: context);

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

  late final _$dadosEnviadosAtom =
      Atom(name: '_GuardaStores.dadosEnviados', context: context);

  @override
  bool get dadosEnviados {
    _$dadosEnviadosAtom.reportRead();
    return super.dadosEnviados;
  }

  @override
  set dadosEnviados(bool value) {
    _$dadosEnviadosAtom.reportWrite(value, super.dadosEnviados, () {
      super.dadosEnviados = value;
    });
  }

  late final _$clicadoAtom =
      Atom(name: '_GuardaStores.clicado', context: context);

  @override
  bool get clicado {
    _$clicadoAtom.reportRead();
    return super.clicado;
  }

  @override
  set clicado(bool value) {
    _$clicadoAtom.reportWrite(value, super.clicado, () {
      super.clicado = value;
    });
  }

  late final _$guardaAtom =
      Atom(name: '_GuardaStores.guarda', context: context);

  @override
  Guarda? get guarda {
    _$guardaAtom.reportRead();
    return super.guarda;
  }

  @override
  set guarda(Guarda? value) {
    _$guardaAtom.reportWrite(value, super.guarda, () {
      super.guarda = value;
    });
  }

  late final _$userAtom = Atom(name: '_GuardaStores.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$tokensAtom =
      Atom(name: '_GuardaStores.tokens', context: context);

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
      AsyncAction('_GuardaStores.checkLogin', context: context);

  @override
  Future<bool> checkLogin() {
    return _$checkLoginAsyncAction.run(() => super.checkLogin());
  }

  late final _$salvaTokensAsyncAction =
      AsyncAction('_GuardaStores.salvaTokens', context: context);

  @override
  Future<void> salvaTokens(String? access, String? refresh) {
    return _$salvaTokensAsyncAction
        .run(() => super.salvaTokens(access, refresh));
  }

  late final _$efetuaLoginAsyncAction =
      AsyncAction('_GuardaStores.efetuaLogin', context: context);

  @override
  Future<bool> efetuaLogin(String cpf, String password) {
    return _$efetuaLoginAsyncAction.run(() => super.efetuaLogin(cpf, password));
  }

  late final _$apagaTokensAsyncAction =
      AsyncAction('_GuardaStores.apagaTokens', context: context);

  @override
  Future<bool> apagaTokens() {
    return _$apagaTokensAsyncAction.run(() => super.apagaTokens());
  }

  late final _$atualizaTokenAccessAsyncAction =
      AsyncAction('_GuardaStores.atualizaTokenAccess', context: context);

  @override
  Future<void> atualizaTokenAccess() {
    return _$atualizaTokenAccessAsyncAction
        .run(() => super.atualizaTokenAccess());
  }

  late final _$getGuardaAsyncAction =
      AsyncAction('_GuardaStores.getGuarda', context: context);

  @override
  Future<void> getGuarda(Map<String, dynamic> tokens) {
    return _$getGuardaAsyncAction.run(() => super.getGuarda(tokens));
  }

  late final _$mudarSenhaAsyncAction =
      AsyncAction('_GuardaStores.mudarSenha', context: context);

  @override
  Future<bool> mudarSenha(
      String senhaAntiga, String senha, String confirmaSenha) {
    return _$mudarSenhaAsyncAction
        .run(() => super.mudarSenha(senhaAntiga, senha, confirmaSenha));
  }

  late final _$enviaEmailRedefenirSenhaAsyncAction =
      AsyncAction('_GuardaStores.enviaEmailRedefenirSenha', context: context);

  @override
  Future<bool> enviaEmailRedefenirSenha(String email) {
    return _$enviaEmailRedefenirSenhaAsyncAction
        .run(() => super.enviaEmailRedefenirSenha(email));
  }

  late final _$enviaDadosQrCodeAsyncAction =
      AsyncAction('_GuardaStores.enviaDadosQrCode', context: context);

  @override
  Future<void> enviaDadosQrCode(String dados) {
    return _$enviaDadosQrCodeAsyncAction
        .run(() => super.enviaDadosQrCode(dados));
  }

  late final _$_GuardaStoresActionController =
      ActionController(name: '_GuardaStores', context: context);

  @override
  void limpaMensagem() {
    final _$actionInfo = _$_GuardaStoresActionController.startAction(
        name: '_GuardaStores.limpaMensagem');
    try {
      return super.limpaMensagem();
    } finally {
      _$_GuardaStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setdadosEnviados(bool value) {
    final _$actionInfo = _$_GuardaStoresActionController.startAction(
        name: '_GuardaStores.setdadosEnviados');
    try {
      return super.setdadosEnviados(value);
    } finally {
      _$_GuardaStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setClicado(bool value) {
    final _$actionInfo = _$_GuardaStoresActionController.startAction(
        name: '_GuardaStores.setClicado');
    try {
      return super.setClicado(value);
    } finally {
      _$_GuardaStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mensagem: ${mensagem},
dadosEnviados: ${dadosEnviados},
clicado: ${clicado},
guarda: ${guarda},
user: ${user},
tokens: ${tokens},
getdadosEnviados: ${getdadosEnviados},
getClicado: ${getClicado},
getTokens: ${getTokens}
    ''';
  }
}
