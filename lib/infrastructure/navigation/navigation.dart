import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainScreen(),
      binding: MainControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileScreen(),
      binding: ProfileControllerBinding(),
    ),
    GetPage(
      name: Routes.CERTIFICATION,
      page: () => CertificationScreen(),
      binding: CertificationControllerBinding(),
    ),
    GetPage(
      name: Routes.BOOKSHELF,
      page: () => BookshelfScreen(),
      binding: BookshelfControllerBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashControllerBinding(),
    ),
    GetPage(
      name: Routes.LIST_DATA_CERTIFICATIONS,
      page: () => ListDataCertificationsScreen(),
      binding: ListDataCertificationsControllerBinding(),
    ),
    GetPage(
      name: Routes.CATEGORY_CERTIFICATIONS,
      page: () => CategoryCertificationsScreen(),
      binding: CategoryCertificationsControllerBinding(),
    ),
    GetPage(
      name: Routes.REGISTRY,
      page: () => RegistryScreen(),
      binding: RegistryControllerBinding(),
    ),
    GetPage(
      name: Routes.VERIFICATION_EMAIL,
      page: () => VerificationEmailScreen(),
      binding: VerificationEmailControllerBinding(),
    ),
  ];
}
