import 'package:dartz/dartz.dart';
import 'package:netflix_mock/domain/core/failures/main_failure.dart';
import 'package:netflix_mock/domain/hot%20and%20new/models/hot_and_new.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNewData>> hotAndNewData();
}
