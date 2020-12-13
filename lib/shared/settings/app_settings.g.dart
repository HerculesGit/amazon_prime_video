// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppSettings on _AppSettingsBase, Store {
  final _$currentLanguangeAtom =
      Atom(name: '_AppSettingsBase.currentLanguange');

  @override
  String get currentLanguange {
    _$currentLanguangeAtom.reportRead();
    return super.currentLanguange;
  }

  @override
  set currentLanguange(String value) {
    _$currentLanguangeAtom.reportWrite(value, super.currentLanguange, () {
      super.currentLanguange = value;
    });
  }

  final _$changeLanguageAsyncAction =
      AsyncAction('_AppSettingsBase.changeLanguage');

  @override
  Future<void> changeLanguage(Locale locale, String language) {
    return _$changeLanguageAsyncAction
        .run(() => super.changeLanguage(locale, language));
  }

  @override
  String toString() {
    return '''
currentLanguange: ${currentLanguange}
    ''';
  }
}
