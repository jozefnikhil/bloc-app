import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_mock/domain/core/failures/main_failure.dart';
import 'package:netflix_mock/domain/hot%20and%20new/hot_and_new_service.dart';
import 'package:netflix_mock/domain/hot%20and%20new/models/hot_and_new.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    on<LoadDatainComingSoon>((event, emit) async {
      emit(const HotAndNewState(
          hotAndnewdata: [], isLoading: true, hasError: false));

      final result = await _hotAndNewService.hotAndNewData();
      final newState = result.fold((MainFailure failure) {
        return const HotAndNewState(
            hotAndnewdata: [], isLoading: false, hasError: true);
      }, (HotAndNewData resp) {
        return HotAndNewState(
          hotAndnewdata: resp.movies!.toList(),
          isLoading: false,
          hasError: false,
        );
      });

      emit(newState);
    });
  }
}
