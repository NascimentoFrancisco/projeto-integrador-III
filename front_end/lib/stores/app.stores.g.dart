// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStores on _AppStores, Store {
  Computed<bool>? _$getUserResponsavelComputed;

  @override
  bool get getUserResponsavel => (_$getUserResponsavelComputed ??=
          Computed<bool>(() => super.getUserResponsavel,
              name: '_AppStores.getUserResponsavel'))
      .value;
  Computed<bool>? _$getClickedComputed;

  @override
  bool get getClicked => (_$getClickedComputed ??=
          Computed<bool>(() => super.getClicked, name: '_AppStores.getClicked'))
      .value;

  late final _$userResponsavelAtom =
      Atom(name: '_AppStores.userResponsavel', context: context);

  @override
  bool get userResponsavel {
    _$userResponsavelAtom.reportRead();
    return super.userResponsavel;
  }

  @override
  set userResponsavel(bool value) {
    _$userResponsavelAtom.reportWrite(value, super.userResponsavel, () {
      super.userResponsavel = value;
    });
  }

  late final _$clickedAtom = Atom(name: '_AppStores.clicked', context: context);

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

  late final _$atualizaUserTipoAsyncAction =
      AsyncAction('_AppStores.atualizaUserTipo', context: context);

  @override
  Future<void> atualizaUserTipo() {
    return _$atualizaUserTipoAsyncAction.run(() => super.atualizaUserTipo());
  }

  late final _$setAlunoAsyncAction =
      AsyncAction('_AppStores.setAluno', context: context);

  @override
  Future<void> setAluno() {
    return _$setAlunoAsyncAction.run(() => super.setAluno());
  }

  late final _$setResponsavelAsyncAction =
      AsyncAction('_AppStores.setResponsavel', context: context);

  @override
  Future<void> setResponsavel() {
    return _$setResponsavelAsyncAction.run(() => super.setResponsavel());
  }

  late final _$_AppStoresActionController =
      ActionController(name: '_AppStores', context: context);

  @override
  void setUserResponsavel(bool value) {
    final _$actionInfo = _$_AppStoresActionController.startAction(
        name: '_AppStores.setUserResponsavel');
    try {
      return super.setUserResponsavel(value);
    } finally {
      _$_AppStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setClicked() {
    final _$actionInfo =
        _$_AppStoresActionController.startAction(name: '_AppStores.setClicked');
    try {
      return super.setClicked();
    } finally {
      _$_AppStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userResponsavel: ${userResponsavel},
clicked: ${clicked},
getUserResponsavel: ${getUserResponsavel},
getClicked: ${getClicked}
    ''';
  }
}
