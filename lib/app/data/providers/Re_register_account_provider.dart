import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class ReRegisterAccount {
  static Future<String> postReRegisterAccount(String email) async {
    MainModel result = await MainProvider.postAPI(
        url: 'register_kirim_ulang.php', body: {'email_login': email});
    return result.message.toString();
  }
}
