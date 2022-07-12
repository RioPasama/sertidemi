class PaymentMethodModel {
  String? idpayment;
  String? iconPayment;
  String? metodePayment;
  String? nomorPayment;
  String? penerimaPayment;
  PaymentMethodModel(
      {required this.idpayment,
      required this.iconPayment,
      required this.metodePayment,
      required this.nomorPayment,
      required this.penerimaPayment});

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    idpayment = json['idpayment'] ?? '';
    iconPayment = json['icon_payment'] ?? '';
    metodePayment = json['metode_payment'] ?? '';
    nomorPayment = json['nomor_payment'] ?? '';
    penerimaPayment = json['penerima_payment'] ?? '';
  }
}
