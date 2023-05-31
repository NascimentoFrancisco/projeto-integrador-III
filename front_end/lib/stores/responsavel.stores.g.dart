// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsavel.stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResponsavelStores on _ResponsavelStores, Store {
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

  late final _$getResponsavelAsyncAction =
      AsyncAction('_ResponsavelStores.getResponsavel', context: context);

  @override
  Future<void> getResponsavel(Map<String, dynamic> tokens) {
    return _$getResponsavelAsyncAction.run(() => super.getResponsavel(tokens));
  }

  @override
  String toString() {
    return '''
responsavel: ${responsavel},
user: ${user}
    ''';
  }
}
