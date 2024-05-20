import 'package:cookcy/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, void>> getCacheFirstTimer();

  Future<Either<Failure, bool>> getcheckIfUserIsFirstTimer();
}
