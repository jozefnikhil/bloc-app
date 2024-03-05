import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_mock/domain/core/api_end_points.dart';
import 'package:netflix_mock/domain/core/failures/main_failure.dart';
import 'package:netflix_mock/domain/search/models/search_response/search_response.dart';
import 'package:netflix_mock/domain/search/search_service.dart';
import 'package:netflix_mock/infrastructure/api_key.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchResponse>> searchMovies(
      {required String movieQuery}) async {
    try {
      final response = await Dio(BaseOptions(queryParameters: {
        'query': movieQuery
      }, headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com'
      })).get(ApiEndPoints.search);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponse.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioException catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      print(e);
      return const Left(MainFailure.clientFailure());
    }
  }
}
