///class LoginModel is model for API
///
///LoginModel the use for login user
class LoginModel {
  String? idUser;
  String? nama;
  String? alamat;
  String? telp;
  String? loginEmail;
  String? urlImage;
  String? kodeReferal;

  ///[idUser], [nama], [alamat], [telp], [loginEmail], [urlImage] and [kodeReferal]
  ///is data User dan is allowed null
  ///to avoid null data from APIs
  LoginModel(
      {this.idUser,
      this.nama,
      this.alamat,
      this.telp,
      this.loginEmail,
      this.urlImage,
      this.kodeReferal});

  LoginModel.fromJson(Map<String, dynamic> json) {
    idUser = json['iduser'] ?? '';
    nama = json['nama'] ?? '';
    alamat = json['alamat'] ?? '';
    telp = json['telp'] ?? '';
    loginEmail = json['login_email'] ?? '';
    urlImage = json['url_image'] ?? '';
    kodeReferal = json['kode_referal'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['iduser'] = idUser;
    data['nama'] = nama;
    data['alamat'] = alamat;
    data['telp'] = telp;
    data['login_email'] = loginEmail;
    data['url_image'] = urlImage;
    data['kode_referal'] = kodeReferal;
    return data;
  }
}
