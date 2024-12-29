import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/presentation/authentication/bindings/login/login_binding.dart';
import 'package:ubiqmerchant_version_2/presentation/authentication/screens/login/login.dart';
import 'package:ubiqmerchant_version_2/presentation/main/bindings/main_binding.dart';
import 'package:ubiqmerchant_version_2/presentation/main/view/main_view.dart';
import 'package:ubiqmerchant_version_2/presentation/splash/binding.dart';
import 'package:ubiqmerchant_version_2/presentation/splash/splash_view.dart';

part 'routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;
  static final routes = [
    GetPage(
      name: _Paths.splash,
      binding: SplashBinding(),
      page: () => const SplashView(),
    ),
    GetPage(
        name: _Paths.login, binding: LoginBinding(), page: () => LoginView()),
    GetPage(
        name: _Paths.mainView,
        binding: MainBinding(),
        page: () => const MainView())
  ];
}
