import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sertidemi/app/data/data_data.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

///Fetch data from api to model
class RegistryProvider {
  ///Fetch data postRegistryNotImage
  static Future<String> postRegistryNotImage(
      {String? referal,
      required String email,
      required String name,
      required String phoneNumber,
      required String address,
      required String password}) async {
    MainModel result = await MainProvider.postAPI(url: 'register.php', body: {
      'email_login': email,
      'nama': name,
      'no_hp': phoneNumber,
      'alamat': address,
      'pass_login': password,
      'referal': referal ?? ''
    });

    return result.message.toString();
  }

  ///Fetch data postRegistryAddImage
  static Future<String> postRegistryAddImage(
      {File? imageProfile,
      String? referal,
      required String email,
      required String name,
      required String phoneNumber,
      required String address,
      required String password}) async {
    MainModel result = await MainProvider.postMultipartRequestAPI(
        url: 'register.php',
        request:
            http.MultipartRequest('POST', Uri.parse('${urlApi}register.php'))
              ..fields['email_login'] = email
              ..fields['nama'] = name
              ..fields['no_hp'] = phoneNumber
              ..fields['alamat'] = address
              ..fields['pass_login'] = password
              ..fields['referal'] = referal ?? ''
              ..files.add(await http.MultipartFile.fromPath(
                  'uploadedfile', imageProfile!.path)));

    return result.message.toString();
  }
}
