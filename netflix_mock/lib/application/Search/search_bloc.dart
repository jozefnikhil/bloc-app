import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_mock/domain/core/failures/main_failure.dart';
import 'package:netflix_mock/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_mock/domain/downloads/models/downloads.dart';
import 'package:netflix_mock/domain/search/models/search_response/content.dart';
import 'package:netflix_mock/domain/search/models/search_response/search_response.dart';
import 'package:netflix_mock/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    //idle state
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
            searchResultList: [],
            idleList: state.idleList,
            isLoading: false,
            isError: false));
        return;
      }
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      //get trending
      final result = await _downloadsService.getDownloadsImage();
      final _state = result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads5> list) {
        return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });
      //show ui
      emit(_state);
    });
//search result state
    on<SearchMovie>((event, emit) async {
      //get trending
      emit(SearchState(
          searchResultList: [],
          idleList: state.idleList,
          isLoading: true,
          isError: false));
      log('Searching for  ${event.movieQuery}');
      final result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);

      final _state = result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (SearchResponse r) {
        return SearchState(
            searchResultList: r.contents,
            idleList: [],
            isLoading: false,
            isError: false);
      });
      //show ui
      emit(_state);
    });
  }
}
