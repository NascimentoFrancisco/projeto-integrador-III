// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsavel.stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResponsavelStores on _ResponsavelStores, Store {
  Computed<int>? _$getIdAlunoHistoricoListadoComputed;

  @override
  int get getIdAlunoHistoricoListado =>
      (_$getIdAlunoHistoricoListadoComputed ??= Computed<int>(
              () => super.getIdAlunoHistoricoListado,
              name: '_ResponsavelStores.getIdAlunoHistoricoListado'))
          .value;
  Computed<bool>? _$getListaAtualizadaComputed;

  @override
  bool get getListaAtualizada => (_$getListaAtualizadaComputed ??=
          Computed<bool>(() => super.getListaAtualizada,
              name: '_ResponsavelStores.getListaAtualizada'))
      .value;
  Computed<bool>? _$getResponsavelInstanciadoComputed;

  @override
  bool get getResponsavelInstanciado => (_$getResponsavelInstanciadoComputed ??=
          Computed<bool>(() => super.getResponsavelInstanciado,
              name: '_ResponsavelStores.getResponsavelInstanciado'))
      .value;
  Computed<bool>? _$getClickedBotaoComputed;

  @override
  bool get getClickedBotao =>
      (_$getClickedBotaoComputed ??= Computed<bool>(() => super.getClickedBotao,
              name: '_ResponsavelStores.getClickedBotao'))
          .value;

  late final _$listaAtualizadaAtom =
      Atom(name: '_ResponsavelStores.listaAtualizada', context: context);

  @override
  bool get listaAtualizada {
    _$listaAtualizadaAtom.reportRead();
    return super.listaAtualizada;
  }

  @override
  set listaAtualizada(bool value) {
    _$listaAtualizadaAtom.reportWrite(value, super.listaAtualizada, () {
      super.listaAtualizada = value;
    });
  }

  late final _$clickedBotaoAtom =
      Atom(name: '_ResponsavelStores.clickedBotao', context: context);

  @override
  bool get clickedBotao {
    _$clickedBotaoAtom.reportRead();
    return super.clickedBotao;
  }

  @override
  set clickedBotao(bool value) {
    _$clickedBotaoAtom.reportWrite(value, super.clickedBotao, () {
      super.clickedBotao = value;
    });
  }

  late final _$responsavelInstanciadoAtom =
      Atom(name: '_ResponsavelStores.responsavelInstanciado', context: context);

  @override
  bool get responsavelInstanciado {
    _$responsavelInstanciadoAtom.reportRead();
    return super.responsavelInstanciado;
  }

  @override
  set responsavelInstanciado(bool value) {
    _$responsavelInstanciadoAtom
        .reportWrite(value, super.responsavelInstanciado, () {
      super.responsavelInstanciado = value;
    });
  }

  late final _$responsavelAtom =
      Atom(name: '_ResponsavelStores.responsavel', context: context);

  @override
  Responsavel? get responsavel {
    _$responsavelAtom.reportRead();
    return super.responsavel;
  }

  @override
  set responsavel(Responsavel? value) {
    _$responsavelAtom.reportWrite(value, super.responsavel, () {
      super.responsavel = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_ResponsavelStores.user', context: context);

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

  late final _$listaAlunosAtom =
      Atom(name: '_ResponsavelStores.listaAlunos', context: context);

  @override
  List<Aluno> get listaAlunos {
    _$listaAlunosAtom.reportRead();
    return super.listaAlunos;
  }

  @override
  set listaAlunos(List<Aluno> value) {
    _$listaAlunosAtom.reportWrite(value, super.listaAlunos, () {
      super.listaAlunos = value;
    });
  }

  late final _$idAlunoHistoricoListadoAtom = Atom(
      name: '_ResponsavelStores.idAlunoHistoricoListado', context: context);

  @override
  int get idAlunoHistoricoListado {
    _$idAlunoHistoricoListadoAtom.reportRead();
    return super.idAlunoHistoricoListado;
  }

  @override
  set idAlunoHistoricoListado(int value) {
    _$idAlunoHistoricoListadoAtom
        .reportWrite(value, super.idAlunoHistoricoListado, () {
      super.idAlunoHistoricoListado = value;
    });
  }

  late final _$listHistoricoAlunoAtom =
      Atom(name: '_ResponsavelStores.listHistoricoAluno', context: context);

  @override
  List<HistoricoAluno> get listHistoricoAluno {
    _$listHistoricoAlunoAtom.reportRead();
    return super.listHistoricoAluno;
  }

  @override
  set listHistoricoAluno(List<HistoricoAluno> value) {
    _$listHistoricoAlunoAtom.reportWrite(value, super.listHistoricoAluno, () {
      super.listHistoricoAluno = value;
    });
  }

  late final _$mensagemAtom =
      Atom(name: '_ResponsavelStores.mensagem', context: context);

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

  late final _$getResponsavelAsyncAction =
      AsyncAction('_ResponsavelStores.getResponsavel', context: context);

  @override
  Future<void> getResponsavel(Map<String, dynamic> tokens) {
    return _$getResponsavelAsyncAction.run(() => super.getResponsavel(tokens));
  }

  late final _$getAlunoResponsavelAsyncAction =
      AsyncAction('_ResponsavelStores.getAlunoResponsavel', context: context);

  @override
  Future<void> getAlunoResponsavel(Map<String, dynamic> tokens) {
    return _$getAlunoResponsavelAsyncAction
        .run(() => super.getAlunoResponsavel(tokens));
  }

  late final _$getHistoricoAlunoAsyncAction =
      AsyncAction('_ResponsavelStores.getHistoricoAluno', context: context);

  @override
  Future<void> getHistoricoAluno(Map<String, dynamic> tokens, int alunoId,
      [DateTime? inicio, DateTime? fim]) {
    return _$getHistoricoAlunoAsyncAction
        .run(() => super.getHistoricoAluno(tokens, alunoId, inicio, fim));
  }

  late final _$_ResponsavelStoresActionController =
      ActionController(name: '_ResponsavelStores', context: context);

  @override
  void setIdAlunoHistoricoListado(int value) {
    final _$actionInfo = _$_ResponsavelStoresActionController.startAction(
        name: '_ResponsavelStores.setIdAlunoHistoricoListado');
    try {
      return super.setIdAlunoHistoricoListado(value);
    } finally {
      _$_ResponsavelStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListaAtualizada(bool value) {
    final _$actionInfo = _$_ResponsavelStoresActionController.startAction(
        name: '_ResponsavelStores.setListaAtualizada');
    try {
      return super.setListaAtualizada(value);
    } finally {
      _$_ResponsavelStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setResponsavelInstanciado(bool value) {
    final _$actionInfo = _$_ResponsavelStoresActionController.startAction(
        name: '_ResponsavelStores.setResponsavelInstanciado');
    try {
      return super.setResponsavelInstanciado(value);
    } finally {
      _$_ResponsavelStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limpaListaalunos() {
    final _$actionInfo = _$_ResponsavelStoresActionController.startAction(
        name: '_ResponsavelStores.limpaListaalunos');
    try {
      return super.limpaListaalunos();
    } finally {
      _$_ResponsavelStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setClickedBotao(bool value) {
    final _$actionInfo = _$_ResponsavelStoresActionController.startAction(
        name: '_ResponsavelStores.setClickedBotao');
    try {
      return super.setClickedBotao(value);
    } finally {
      _$_ResponsavelStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaAtualizada: ${listaAtualizada},
clickedBotao: ${clickedBotao},
responsavelInstanciado: ${responsavelInstanciado},
responsavel: ${responsavel},
user: ${user},
listaAlunos: ${listaAlunos},
idAlunoHistoricoListado: ${idAlunoHistoricoListado},
listHistoricoAluno: ${listHistoricoAluno},
mensagem: ${mensagem},
getIdAlunoHistoricoListado: ${getIdAlunoHistoricoListado},
getListaAtualizada: ${getListaAtualizada},
getResponsavelInstanciado: ${getResponsavelInstanciado},
getClickedBotao: ${getClickedBotao}
    ''';
  }
}
