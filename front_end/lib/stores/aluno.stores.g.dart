// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aluno.stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AlunoStores on _AlunoStores, Store {
  Computed<bool>? _$getIsClickedComputed;

  @override
  bool get getIsClicked =>
      (_$getIsClickedComputed ??= Computed<bool>(() => super.getIsClicked,
              name: '_AlunoStores.getIsClicked'))
          .value;

  late final _$cursoAtom = Atom(name: '_AlunoStores.curso', context: context);

  @override
  Curso? get curso {
    _$cursoAtom.reportRead();
    return super.curso;
  }

  @override
  set curso(Curso? value) {
    _$cursoAtom.reportWrite(value, super.curso, () {
      super.curso = value;
    });
  }

  late final _$userAtom = Atom(name: '_AlunoStores.user', context: context);

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

  late final _$alunoAtom = Atom(name: '_AlunoStores.aluno', context: context);

  @override
  Aluno? get aluno {
    _$alunoAtom.reportRead();
    return super.aluno;
  }

  @override
  set aluno(Aluno? value) {
    _$alunoAtom.reportWrite(value, super.aluno, () {
      super.aluno = value;
    });
  }

  late final _$isClickedAtom =
      Atom(name: '_AlunoStores.isClicked', context: context);

  @override
  bool get isClicked {
    _$isClickedAtom.reportRead();
    return super.isClicked;
  }

  @override
  set isClicked(bool value) {
    _$isClickedAtom.reportWrite(value, super.isClicked, () {
      super.isClicked = value;
    });
  }

  late final _$mensagemAtom =
      Atom(name: '_AlunoStores.mensagem', context: context);

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

  late final _$getAlunoAsyncAction =
      AsyncAction('_AlunoStores.getAluno', context: context);

  @override
  Future<void> getAluno(Map<String, dynamic> tokens) {
    return _$getAlunoAsyncAction.run(() => super.getAluno(tokens));
  }

  @override
  String toString() {
    return '''
curso: ${curso},
user: ${user},
aluno: ${aluno},
isClicked: ${isClicked},
mensagem: ${mensagem},
getIsClicked: ${getIsClicked}
    ''';
  }
}
