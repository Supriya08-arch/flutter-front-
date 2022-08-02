import 'package:get/get.dart';
import 'package:getx/pages/dashboard/dashboard_binding.dart';
import 'package:getx/pages/dashboard/dashboard_page.dart';
import 'package:getx/pages/splash/onboarding/onboarding_binding.dart';
import 'package:getx/pages/splash/onboarding/onboarding.dart';
import 'package:getx/pages/splash/splash/splash_binding.dart';
import 'package:getx/pages/splash/splash/splashpage.dart';
import 'package:getx/pages/splash/starter/starter_binding.dart';
import 'package:getx/pages/splash/starter/starter_page.dart';
import 'app_routes.dart';
import 'package:getx/pages/login/pages/login_binding.dart';
import 'package:getx/pages/login/pages/login_page.dart';
import 'package:getx/pages/register/register_binding.dart';
import 'package:getx/pages/register/register_page.dart';
import 'package:getx/sensor/fingerprint_binding.dart';
import 'package:getx/sensor/fingerprintsensor.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => IntroPage(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.STARTER,
      page: () => StarterPage(),
      binding: StarterBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.FINGERPRINT,
      page: () => FingerprintAuth(),
      binding: FingerPrintBinding(),
    ),
  ];
}
