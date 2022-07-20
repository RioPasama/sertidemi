class CustomerServicesModel {
  String? nomorTelp;
  String? message;
  String? icon;

  CustomerServicesModel({this.nomorTelp, this.message, this.icon});

  CustomerServicesModel.fromJson(Map<String, dynamic> json) {
    nomorTelp = json['nomor_telp'] ?? '';
    message = json['message'] ?? '';
  }
}
