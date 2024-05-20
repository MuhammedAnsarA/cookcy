part of 'router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      final prefs = sl<SharedPreferences>();
      return _pageBuilder(
        (context) {
          if (prefs.getBool(kFirstTimerKey) ?? true) {
            return const OnboardingPage();
          } else if (sl<FirebaseAuth>().currentUser != null) {
            return const MainScreen();
          }
          return const LoginPage();
        },
        settings: settings,
      );

    case SignUpPage.routeName:
      return _pageBuilder(
        (_) => const SignUpPage(),
        settings: settings,
      );

    case LoginPage.routeName:
      return _pageBuilder(
        (_) => const LoginPage(),
        settings: settings,
      );

    case ForgotPasswordPage.routeName:
      return _pageBuilder(
        (_) => const ForgotPasswordPage(),
        settings: settings,
      );

    case MainScreen.routeName:
      return _pageBuilder(
        (_) => const MainScreen(),
        settings: settings,
      );

    case HomePage.routeName:
      return _pageBuilder(
        (_) => const HomePage(),
        settings: settings,
      );

    case ProductPage.routeName:
      return _pageBuilder(
        (_) => const ProductPage(),
        settings: settings,
      );

    case TabbarSeeAll.routeName:
      return _pageBuilder(
        (_) => const TabbarSeeAll(),
        settings: settings,
      );

    case NotificationPage.routeName:
      return _pageBuilder(
        (_) => const NotificationPage(),
        settings: settings,
      );

    case UploadPage.routeName:
      return _pageBuilder(
        (_) => const UploadPage(),
        settings: settings,
      );

    default:
      return _pageBuilder((_) => const PageUnderConstruction(),
          settings: settings);
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
