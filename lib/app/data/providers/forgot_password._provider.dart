import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class ForgotPassword {
  static Future<String> postForgotPassword(String email) async {
    MainModel result = await MainProvider.postAPI(
        url: 'lupa_password.php', body: {'email_login': email});
    return result.message.toString();
  }
}
