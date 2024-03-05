import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_mock/domain/core/api_end_points.dart';
import 'package:netflix_mock/domain/core/failures/main_failure.dart';
import 'package:netflix_mock/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_mock/domain/downloads/models/downloads.dart';
import 'package:dio/dio.dart';
import 'package:netflix_mock/infrastructure/api_key.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads5>>> getDownloadsImage() async {
    try {
      final response = await Dio(BaseOptions(headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com'
      })).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        final downloadlist = (response.data['movies'] as List).map((e) {
          return Downloads5.fromJson(e);
        }).toList();

        return Right(downloadlist);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e);
      return const Left(MainFailure.clientFailure());
    }
  }
}
