import 'package:cookcy/application/slider/slider_cubit.dart';
import 'package:cookcy/application/tab_bar/tab_bar_bloc.dart';
import 'package:cookcy/core/utils/const/text_strings.dart';
import 'package:cookcy/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'application/blocs.dart';
import 'core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                sl<OnboardingCubit>()..checkIfUserIsFirstTimer()),
        BlocProvider(create: (context) => sl<AuthBloc>()),
        BlocProvider(create: (context) => ObscureTextCubit()),
        BlocProvider(create: (context) => TabBarBloc()),
        BlocProvider(create: (context) => SliderCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: TTexts.appName,
          theme: TAppTheme.lightTheme,
          onGenerateRoute: generateRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
