import 'package:cookcy/core/errors/failures.dart';
import 'package:cookcy/domain/onboarding/repositories/onboarding_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kFirstTimerKey = 'first_timer';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final SharedPreferences _prefs;

  OnboardingRepositoryImpl(this._prefs);

  @override
  Future<Either<Failure, void>> getCacheFirstTimer() async {
    try {
      await _prefs.setBool(kFirstTimerKey, false);
      return const Right(null);
    } catch (e) {
      debugPrint(e.toString());
      return Left(CacheFailure(message: e.toString(), statusCode: 500));
    }
  }

  @override
  Future<Either<Failure, bool>> getcheckIfUserIsFirstTimer() async {
    try {
      final result = _prefs.getBool(kFirstTimerKey) ?? true;
      return Right(result);
    } catch (e) {
      debugPrint(e.toString());
      return Left(CacheFailure(message: e.toString(), statusCode: 500));
    }
  }
}
