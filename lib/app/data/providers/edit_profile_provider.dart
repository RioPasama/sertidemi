import 'dart:async';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sertidemi/app/data/data_data.dart';
import 'package:sertidemi/app/data/models/login_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

///Fetch data from api to model
class EditProfileProvider {
  ///Fetch data EditProfileProvider
  static Future<LoginModel> postEditProfile(
      {File? imageProfile,
      String name = '',
      String telp = '',
      String pasLogin = ''}) async {
    MainModel result = await MainProvider.postMultipartRequestAPI(
        url: 'profil.php',
        request: http.MultipartRequest('POST', Uri.parse('${urlApi}profil.php'))
          ..fields['id'] = GetStorage().read('idUser')
          ..fields['nama'] = name
          ..fields['uploadedfile'] = ''
          ..fields['telp'] = telp
          ..fields['pass_login'] = pasLogin);

    return LoginModel.fromJson(result.data);
  }

  static Future<LoginModel> postEditProfileImage(
      {File? imageProfile,
      String name = '',
      String telp = '',
      String pasLogin = ''}) async {
    MainModel result = await MainProvider.postMultipartRequestAPI(
        url: 'profil.php',
        request: http.MultipartRequest('POST', Uri.parse('${urlApi}profil.php'))
          ..fields['id'] = GetStorage().read('idUser')
          ..fields['nama'] = name
          ..fields['uploadedfile'] = ''
          ..fields['telp'] = telp
          ..fields['pass_login'] = pasLogin
          ..files.add(await http.MultipartFile.fromPath(
              'uploadedfile', imageProfile!.path)));

    return LoginModel.fromJson(result.data);
  }
}
