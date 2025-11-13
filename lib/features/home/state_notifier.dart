import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_notifier.freezed.dart';

@freezed
class AppState<T> with _$AppState<T> {
  const factory AppState.initial() = _Initial;
  const factory AppState.loading() = _Loading;
  const factory AppState.data(T data) = _Data<T>;
  const factory AppState.error(Object error) = _Error;
}
