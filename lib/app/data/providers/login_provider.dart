import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/data_data.dart';
import 'package:sertidemi/domain/core/extensions/apiErrorHandler.extension.dart';

import '../models/login_model.dart';

class LoginProvider extends GetConnect {
  Future<Login> postLogin(
      {required String email, required String password}) async {
    String url = '${urlApi}login.php';
    dynamic res;

    try {
      final response = await post(
        '${urlApi}login.php',
        {'email_login': email, 'pass_login': password},
      ).timeout(const Duration(seconds: 20));
      log('Status Code: ${response.statusCode}\nurl: $url\nemail_login: $email\npass_login: $password\n${response.bodyString}');

      res = response;
      final result = jsonDecode(response.body);
      if (response.hasError) {
        throw '';
      }
      return Login.fromJson(result);
    } catch (e) {
      apiErrorHandler(res, e.toString());
      rethrow;
    }
  }
}
