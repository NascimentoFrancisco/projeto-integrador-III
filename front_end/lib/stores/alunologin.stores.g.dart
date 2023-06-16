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
  Computed<String>? _$getTipoQrCodeComputed;

  @override
  String get getTipoQrCode =>
      (_$getTipoQrCodeComputed ??= Computed<String>(() => super.getTipoQrCode,
              name: '_AlunoLoginStores.getTipoQrCode'))
          .value;
  Computed<Map<String, dynamic>>? _$getTokensComputed;

  @override
  Map<String, dynamic> get getTokens => (_$getTokensComputed ??=
          Computed<Map<String, dynamic>>(() => super.getTokens,
              name: '_AlunoLoginStores.getTokens'))
      .value;
  Computed<int>? _$getcontSegundosQrcodeComputed;

  @override
  int get getcontSegundosQrcode => (_$getcontSegundosQrcodeComputed ??=
          Computed<int>(() => super.getcontSegundosQrcode,
              name: '_AlunoLoginStores.getcontSegundosQrcode'))
      .value;
  Computed<Map<String, String>>? _$getDadosQrCodeComputed;

  @override
  Map<String, String> get getDadosQrCode => (_$getDadosQrCodeComputed ??=
          Computed<Map<String, String>>(() => super.getDadosQrCode,
              name: '_AlunoLoginStores.getDadosQrCode'))
      .value;
  Computed<bool>? _$getDadosQrCodeValidoComputed;

  @override
  bool get getDadosQrCodeValido => (_$getDadosQrCodeValidoComputed ??=
          Computed<bool>(() => super.getDadosQrCodeValido,
              name: '_AlunoLoginStores.getDadosQrCodeValido'))
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

  late final _$tipoQrCodeAtom =
      Atom(name: '_AlunoLoginStores.tipoQrCode', context: context);

  @override
  String get tipoQrCode {
    _$tipoQrCodeAtom.reportRead();
    return super.tipoQrCode;
  }

  @override
  set tipoQrCode(String value) {
    _$tipoQrCodeAtom.reportWrite(value, super.tipoQrCode, () {
      super.tipoQrCode = value;
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

  late final _$dadosQrCodeAtom =
      Atom(name: '_AlunoLoginStores.dadosQrCode', context: context);

  @override
  Map<String, String> get dadosQrCode {
    _$dadosQrCodeAtom.reportRead();
    return super.dadosQrCode;
  }

  @override
  set dadosQrCode(Map<String, String> value) {
    _$dadosQrCodeAtom.reportWrite(value, super.dadosQrCode, () {
      super.dadosQrCode = value;
    });
  }

  late final _$contSegundosQrcodeAtom =
      Atom(name: '_AlunoLoginStores.contSegundosQrcode', context: context);

  @override
  int get contSegundosQrcode {
    _$contSegundosQrcodeAtom.reportRead();
    return super.contSegundosQrcode;
  }

  @override
  set contSegundosQrcode(int value) {
    _$contSegundosQrcodeAtom.reportWrite(value, super.contSegundosQrcode, () {
      super.contSegundosQrcode = value;
    });
  }

  late final _$dadosQrCodeValidoAtom =
      Atom(name: '_AlunoLoginStores.dadosQrCodeValido', context: context);

  @override
  bool get dadosQrCodeValido {
    _$dadosQrCodeValidoAtom.reportRead();
    return super.dadosQrCodeValido;
  }

  @override
  set dadosQrCodeValido(bool value) {
    _$dadosQrCodeValidoAtom.reportWrite(value, super.dadosQrCodeValido, () {
      super.dadosQrCodeValido = value;
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
  Future<bool> efetuaLogin(String cpf, String password) {
    return _$efetuaLoginAsyncAction.run(() => super.efetuaLogin(cpf, password));
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
  void setTipoQrcode(String value) {
    final _$actionInfo = _$_AlunoLoginStoresActionController.startAction(
        name: '_AlunoLoginStores.setTipoQrcode');
    try {
      return super.setTipoQrcode(value);
    } finally {
      _$_AlunoLoginStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setContSegundosQrcode(int value) {
    final _$actionInfo = _$_AlunoLoginStoresActionController.startAction(
        name: '_AlunoLoginStores.setContSegundosQrcode');
    try {
      return super.setContSegundosQrcode(value);
    } finally {
      _$_AlunoLoginStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDadosQrCode() {
    final _$actionInfo = _$_AlunoLoginStoresActionController.startAction(
        name: '_AlunoLoginStores.setDadosQrCode');
    try {
      return super.setDadosQrCode();
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
tipoQrCode: ${tipoQrCode},
tokens: ${tokens},
dadosQrCode: ${dadosQrCode},
contSegundosQrcode: ${contSegundosQrcode},
dadosQrCodeValido: ${dadosQrCodeValido},
getClickLogin: ${getClickLogin},
alunoLogado: ${alunoLogado},
getTipoQrCode: ${getTipoQrCode},
getTokens: ${getTokens},
getcontSegundosQrcode: ${getcontSegundosQrcode},
getDadosQrCode: ${getDadosQrCode},
getDadosQrCodeValido: ${getDadosQrCodeValido}
    ''';
  }
}
