import 'package:cookcy/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookcy/domain/onboarding/repositories/onboarding_repository.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingRepository _repository;
  OnboardingCubit(
    this._repository,
  ) : super(OnboardingInitial());

  Future<void> cacheFirstTimer() async {
    emit(CachingFirstTimer());

    final Either<Failure, void> onboarding =
        await _repository.getCacheFirstTimer();

    onboarding.fold(
      (failure) => emit(OnboardingError(failure.errorMessage)),
      (_) => emit(UserCashed()),
    );
  }

  Future<void> checkIfUserIsFirstTimer() async {
    emit(CheckingIfUserIsFirstTimer());

    final Either<Failure, bool> onboarding =
        await _repository.getcheckIfUserIsFirstTimer();

    onboarding.fold(
      (_) => emit(const OnboardingStatus(isFirstTimer: true)),
      (status) => emit(OnboardingStatus(isFirstTimer: status)),
    );
  }
}
