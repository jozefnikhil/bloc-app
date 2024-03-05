part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isloading,
    required List<Downloads5>? downloads,
    required Option<Either<MainFailure, List<Downloads5>>>
        downloadsFailureOrSuccessOption,
  }) = _DownloadsState;

  factory DownloadsState.initial() {
    return DownloadsState(
        downloads: [],
        isloading: false,
        downloadsFailureOrSuccessOption: none());
  }
}
