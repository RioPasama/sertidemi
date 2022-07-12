class StatusTransactionModel {
  String? idTransaksi;
  String? noInvoice;
  dynamic total;
  String? metodePembayaranal;
  String? namaProduct;
  String? createdAt;

  StatusTransactionModel(
      {this.idTransaksi,
      this.noInvoice,
      this.total,
      this.metodePembayaranal,
      this.namaProduct,
      this.createdAt});

  StatusTransactionModel.fromJson(Map<String, dynamic> json) {
    idTransaksi = json['id_transaksi'] ?? '';
    noInvoice = json['no_invoice'] ?? '';
    total = json['total'] ?? '';
    metodePembayaranal = json['metode_pembayaran'] ?? '';
    namaProduct = json['nama_event'] ?? json['nama_assessment'] ?? '';
    createdAt = json['created_at'] ?? '';
  }
}
