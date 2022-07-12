import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sertidemi/infrastructure/navigation/bindings/controllers/home.controller.binding.dart';

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
    GetPage(
      name: Routes.EBOOK,
      page: () => EbookScreen(),
      binding: EbookControllerBinding(),
    ),
    GetPage(
      name: Routes.EDIT_PROFILE,
      page: () => EditProfileScreen(),
      binding: EditProfileControllerBinding(),
    ),
    GetPage(
      name: Routes.QUESTIONS_MULTIPLE_CHOICE,
      page: () => QuestionsMultipleChoiceScreen(),
      binding: QuestionsMultipleChoiceControllerBinding(),
    ),
    GetPage(
      name: Routes.ASSESSMENT_LIST,
      page: () => AssessmentListScreen(),
      binding: AssessmentListControllerBinding(),
    ),
    GetPage(
      name: Routes.ASSESSMENT_DETAIL,
      page: () => AssessmentDetailScreen(),
      binding: AssessmentDetailControllerBinding(),
    ),
    GetPage(
      name: Routes.REGISTER_ASSESSMENT,
      page: () => RegisterAssessmentScreen(),
      binding: RegisterAssessmentControllerBinding(),
    ),
    GetPage(
      name: Routes.EVENT_DETAIL,
      page: () => EventDetailScreen(),
      binding: EventDetailControllerBinding(),
    ),
    GetPage(
      name: Routes.REGISTER_EVENT,
      page: () => RegisterEventScreen(),
      binding: RegisterEventControllerBinding(),
    ),
    GetPage(
      name: Routes.EVENT,
      page: () => EventScreen(),
      binding: EventControllerBinding(),
    ),
    GetPage(
      name: Routes.ASSESSMENT,
      page: () => AssessmentScreen(),
      binding: AssessmentControllerBinding(),
    ),
    GetPage(
      name: Routes.LIST_CATEGORY,
      page: () => ListCategoryScreen(),
      binding: ListCategoryControllerBinding(),
    ),
    GetPage(
      name: Routes.MORE,
      page: () => MoreScreen(),
      binding: MoreControllerBinding(),
    ),
    GetPage(
      name: Routes.EVENT_LIST,
      page: () => EventListScreen(),
      binding: EventListControllerBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => NotificationScreen(),
      binding: NotificationControllerBinding(),
    ),
    GetPage(
      name: Routes.STATUS_TRANSACTION,
      page: () => StatusTransactionScreen(),
      binding: StatusTransactionControllerBinding(),
    ),
    GetPage(
      name: Routes.PAYMENT,
      page: () => PaymentScreen(),
      binding: PaymentControllerBinding(),
    ),
    GetPage(
      name: Routes.MATERI,
      page: () => MateriScreen(),
      binding: MateriControllerBinding(),
    ),
    GetPage(
      name: Routes.TIKET_DETAIL_ASSESSMENT,
      page: () => TiketDetailAssessmentScreen(),
      binding: TiketDetailAssessmentControllerBinding(),
    ),
    GetPage(
      name: Routes.TIKET_DETAIL_EVENT,
      page: () => const TiketDetailEventScreen(),
      binding: TiketDetailEventControllerBinding(),
    ),
    GetPage(
      name: Routes.START_ASSESSMENT,
      page: () => const StartAssessmentScreen(),
      binding: StartAssessmentControllerBinding(),
    ),
    GetPage(
      name: Routes.FINISH_ASSESSMENT,
      page: () => FinishAssessmentScreen(),
      binding: FinishAssessmentControllerBinding(),
    ),
    GetPage(
      name: Routes.LIST_TRANSACTION,
      page: () => ListTransactionScreen(),
      binding: ListTransactionControllerBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_TRANSACTION,
      page: () => DetailTransactionScreen(),
      binding: DetailTransactionControllerBinding(),
    ),
    GetPage(
      name: Routes.LIST_TIKET,
      page: () => ListTiketScreen(),
      binding: ListTiketControllerBinding(),
    ),
    GetPage(
      name: Routes.CERTIFICATE,
      page: () => const CertificateScreen(),
      binding: CertificateControllerBinding(),
    ),
    GetPage(
      name: Routes.LIST_CERTIFICATE,
      page: () => ListCertificateScreen(),
      binding: ListCertificateControllerBinding(),
    ),
  ];
}
