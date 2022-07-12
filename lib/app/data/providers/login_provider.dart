import 'dart:async';
import 'package:sertidemi/app/data/models/login_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

///Fetch data from api to model
class LoginProvider {
  ///Fetch data postLogin
  static Future<LoginModel> postLogin(
      {required String email, required String password}) async {
    MainModel result = await MainProvider.postAPI(url: 'login.php', body: {
      'email_login': email,
      'pass_login': password,
    });

    return LoginModel.fromJson(result.data);
  }
}
