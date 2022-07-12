import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';
import 'package:sertidemi/presentation/main/controllers/main.controller.dart';
import 'package:sertidemi/app/data/models/login_model.dart';
import 'package:sertidemi/app/data/providers/login_provider.dart';

/// class AuthenticationController functions to access the login and get user APIs.
///
/// There is also a function for session login, and logout
class AuthenticationController extends GetxController {
  final MainController mainController = Get.put(MainController());

  RxBool isLogin = false.obs;
  RxString idUser = ''.obs;
  RxString nameUser = ''.obs;
  RxString emailUser = ''.obs;
  RxString kodeReferalUser = ''.obs;
  RxString telpUser = ''.obs;
  RxString urlImageUser = ''.obs;

  ///auth is function detection user is login or not
  void authProfile() async {
    isLogin.value = GetStorage().read('isLogin') ?? false;
    idUser.value = GetStorage().read('idUser') ?? '';
    nameUser.value = GetStorage().read('nameUser') ?? '';
    emailUser.value = GetStorage().read('emailUser') ?? '';
    kodeReferalUser.value = GetStorage().read('kodeReferalUser') ?? '';
    telpUser.value = GetStorage().read('telpUser') ?? '';
    urlImageUser.value = GetStorage().read('urlImageUser') ?? '';

    if (!isLogin.value) {
      Future.delayed(Duration.zero, () {
        mainController.selectedIndex.value = 0;
        Get.toNamed(Routes.LOGIN);
        log('Cek Auth');
      });
    }
  }

  void auth() {
    isLogin.value = GetStorage().read('isLogin') ?? false;
    idUser.value = GetStorage().read('idUser') ?? '';
    if (!isLogin.value) {
      Future.delayed(Duration.zero, () {
        Get.offNamed(Routes.LOGIN);
      });
    }
  }

  ///login is function for login user by API and save data **GetStorage** [isLogin] `true` and [idUser] `id user`
  /// * [email] is email user `required`
  /// * [password] is password user `required`
  ///
  ///for example :
  ///
  ///```
  ///authenticationControllercontroller.login(
  ///   email: emailTextEditingController.text,
  ///   password: passwordTextEditingController.text);
  ///```
  void login({required String email, required String password}) async {
    LoginModel resultLogin =
        await LoginProvider.postLogin(email: email, password: password);

    isLogin.value = true;

    GetStorage().write('isLogin', true);
    GetStorage().write('idUser', resultLogin.idUser);
    GetStorage().write('nameUser', resultLogin.nama);
    GetStorage().write('emailUser', resultLogin.loginEmail);
    GetStorage().write('kodeReferalUser', resultLogin.kodeReferal);
    GetStorage().write('telpUser', resultLogin.telp);
    GetStorage().write('urlImageUser', resultLogin.urlImage);

    Get.offNamed(Routes.MAIN);
  }

  ///logout is function for logout user, data in **GesStorage** [isLogin] `false` and [idUser] this `delete`
  void logOut() {
    Future.delayed(Duration.zero, () {
      isLogin.value = false;
      mainController.selectedIndex.value = 0;

      GetStorage().write('isLogin', false);
      GetStorage().write('idUser', '');

      log('User logOut');
    });
  }
}
