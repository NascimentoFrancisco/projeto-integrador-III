// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsavel.stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResponsavelStores on _ResponsavelStores, Store {
  Computed<bool>? _$getClickedBotaoComputed;

  @override
  bool get getClickedBotao =>
      (_$getClickedBotaoComputed ??= Computed<bool>(() => super.getClickedBotao,
              name: '_ResponsavelStores.getClickedBotao'))
          .value;

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

  late final _$_ResponsavelStoresActionController =
      ActionController(name: '_ResponsavelStores', context: context);

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
clickedBotao: ${clickedBotao},
responsavel: ${responsavel},
user: ${user},
listaAlunos: ${listaAlunos},
getClickedBotao: ${getClickedBotao}
    ''';
  }
}
