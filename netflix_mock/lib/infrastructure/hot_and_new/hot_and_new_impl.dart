import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_mock/domain/core/api_end_points.dart';
import 'package:netflix_mock/domain/core/failures/main_failure.dart';
import 'package:netflix_mock/domain/hot%20and%20new/hot_and_new_service.dart';
import 'package:netflix_mock/domain/hot%20and%20new/models/hot_and_new.dart';
import 'package:netflix_mock/infrastructure/api_key.dart';
@LazySingleton(as:HotAndNewService )
class HotAndNewImp implements HotAndNewService {
  @override
  Future<Either<MainFailure, HotAndNewData>> hotAndNewData() async{
    try {
      final response = await Dio(BaseOptions( headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com'
      })).get(ApiEndPoints.hotAndNewMovie);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewData.fromJson(response.data);
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
  

