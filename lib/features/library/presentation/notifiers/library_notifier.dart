import 'package:film_fount/core/state/state_notifier.dart';
import 'package:film_fount/features/library/domain/entities/watch_list_entity.dart';
import 'package:film_fount/features/library/domain/repositories/library_repository.dart';
import 'package:flutter_riverpod/legacy.dart';

class LibraryNotifier extends StateNotifier<AppState<WatchListEntity>> {
  final LibraryRepository _repository;

  LibraryNotifier(this._repository) : super(AppState.initial()) {
    fetchWatchList();
  }
  WatchListEntity? currentWatchList;

  Future<void> fetchWatchList() async {
    state = AppState.loading();
    try {
      final watchList = await _repository.getLibraryMovies();
      currentWatchList = watchList;
      state = AppState.data(watchList);
    } catch (e) {
      state = AppState.error(e);
    }
  }

  Future<void> changeWatchListView(bool? watched) async {
    state = AppState.loading();

    if (watched == null) {
      state = AppState.data(
        WatchListEntity(watchList: currentWatchList?.watchList),
      );
    } else {
      final filteredWatchList = currentWatchList?.watchList
          ?.where((movie) => movie.watched == watched)
          .toList();

      state = AppState.data(WatchListEntity(watchList: filteredWatchList));
    }
  }
}
