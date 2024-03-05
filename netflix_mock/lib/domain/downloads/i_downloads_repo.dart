import 'package:dartz/dartz.dart';
import 'package:netflix_mock/domain/core/failures/main_failure.dart';
import 'package:netflix_mock/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads5>>> getDownloadsImage();
}
