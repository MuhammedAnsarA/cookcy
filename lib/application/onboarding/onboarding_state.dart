part of 'onboarding_cubit.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {}

class CachingFirstTimer extends OnboardingState {}

class CheckingIfUserIsFirstTimer extends OnboardingState {}

class UserCashed extends OnboardingState {}

class OnboardingStatus extends OnboardingState {
  final bool isFirstTimer;

  const OnboardingStatus({required this.isFirstTimer});

  @override
  List<bool> get props => [isFirstTimer];
}

class OnboardingError extends OnboardingState {
  final String message;

  const OnboardingError(this.message);

  @override
  List<String> get props => [message];
}
