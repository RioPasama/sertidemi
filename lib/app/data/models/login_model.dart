class Login {
  String? idUser;
  String? nama;
  String? alamat;
  String? telp;
  String? loginEmail;
  String? urlImage;

  Login(
      {this.idUser,
      this.nama,
      this.alamat,
      this.telp,
      this.loginEmail,
      this.urlImage});

  Login.fromJson(Map<String, dynamic> json) {
    idUser = json['iduser'] ?? '';
    nama = json['nama'] ?? '';
    alamat = json['nama'] ?? '';
    telp = json['telp'] ?? '';
    loginEmail = json['telp'] ?? '';
    urlImage = json['pesan'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['iduser'] = idUser;
    data['nama'] = nama;
    data['alamat'] = alamat;
    data['telp'] = telp;
    data['login_email'] = loginEmail;
    data['url_image'] = urlImage;
    return data;
  }
}
