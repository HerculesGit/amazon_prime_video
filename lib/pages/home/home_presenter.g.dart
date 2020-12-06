// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_presenter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePresenter on _HomePresenterBase, Store {
  final _$dataAtom = Atom(name: '_HomePresenterBase.data');

  @override
  Map<String, dynamic> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(Map<String, dynamic> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$photosAtom = Atom(name: '_HomePresenterBase.photos');

  @override
  ObservableList<String> get photos {
    _$photosAtom.reportRead();
    return super.photos;
  }

  @override
  set photos(ObservableList<String> value) {
    _$photosAtom.reportWrite(value, super.photos, () {
      super.photos = value;
    });
  }

  final _$loadingAtom = Atom(name: '_HomePresenterBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$findAllWatchableByCategoryAsyncAction =
      AsyncAction('_HomePresenterBase.findAllWatchableByCategory');

  @override
  Future<void> findAllWatchableByCategory(String category) {
    return _$findAllWatchableByCategoryAsyncAction
        .run(() => super.findAllWatchableByCategory(category));
  }

  @override
  String toString() {
    return '''
data: ${data},
photos: ${photos},
loading: ${loading}
    ''';
  }
}
