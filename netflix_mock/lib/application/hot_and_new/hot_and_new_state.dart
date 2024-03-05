part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<Movie> hotAndnewdata,
    required bool isLoading,
    required bool hasError,
  }) = _HotAndNewState;

  factory HotAndNewState.initial() {
    return const HotAndNewState(
        hotAndnewdata: [], isLoading: false, hasError: false);
  }
}
