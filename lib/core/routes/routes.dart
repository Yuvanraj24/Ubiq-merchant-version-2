part of 'pages.dart';

abstract class Routes {
  Routes._();

  static const splash = _Paths.splash;
  static const onboarding = _Paths.onboarding;
  static const login = _Paths.login;
  static const mainView = _Paths.mainView;

  /// Bottom Bar screens
  static const profileView = _Paths.profileView;

  /// Profile Menu screens
  static const shopOrderHistory = _Paths.shopOrderHistory;
}

abstract class _Paths {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const mainView = '/mainView';

  /// Bottom Bar screens
  static const profileView = '/profileView';

  /// Profile Menu screens
  static const shopOrderHistory = '/showOrderHistory';
}
