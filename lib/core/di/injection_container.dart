import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookcy/domain/authentication/repositories/auth_repository.dart';
import 'package:cookcy/domain/onboarding/repositories/onboarding_repository.dart';
import 'package:cookcy/infrastructure/authentication/repository/auth_repository_impl.dart';
import 'package:cookcy/infrastructure/onboarding/repository/onboarding_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../application/blocs.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AuthBloc(sl()));

  sl.registerFactory(() => OnboardingCubit(sl()));

  sl.registerLazySingleton<OnboardingRepository>(
      () => OnboardingRepositoryImpl(sl()));

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(firebaseAuth: sl(), firestore: sl()));

  final firebaseAuth = FirebaseAuth.instance;

  sl.registerLazySingleton(() => firebaseAuth);

  final firestore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => firestore);

  final prefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => prefs);
}
