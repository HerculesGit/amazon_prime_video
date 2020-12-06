import 'package:amazon_prime_video/repositories/watchable_respository.dart';
import 'package:mobx/mobx.dart';
part 'home_presenter.g.dart';

abstract class IHomeContract {}

class HomePresenter = _HomePresenterBase with _$HomePresenter;

abstract class _HomePresenterBase with Store {
  final WatchableRepository repository;
  final IHomeContract iContract;

  _HomePresenterBase(this.iContract, this.repository);

  @observable
  Map<String, dynamic> data = {};

  @observable
  ObservableList<String> photos = ObservableList.of([]);

  @observable
  bool loading = false;

  @action
  Future<void> findAllWatchableByCategory(String category) async {
    loading = true;
    data = await repository.findAllWatchableByCategory(category);
    photos = ObservableList.of(data['carousel']);
    loading = false;
  }
}
