class ListTransactionModel {
  String? idtransaksi;
  String? invoice;
  String? nama;
  String? inputTanggalTransaksi;
  String? statusTransaksi;
  String? totalHargaTicketAkhir;

  ListTransactionModel(
      {this.idtransaksi,
      this.invoice,
      this.nama,
      this.inputTanggalTransaksi,
      this.statusTransaksi,
      this.totalHargaTicketAkhir});

  ListTransactionModel.fromJson(Map<String, dynamic> json) {
    idtransaksi = json['idtransaksi'] ?? '';
    invoice = json['invoice'] ?? '';
    nama = json['nama'] ?? '';
    inputTanggalTransaksi = json['tanggal_input'] ?? '';
    statusTransaksi = json['status_transaksi'] ?? '';
    totalHargaTicketAkhir = json['total_pembayaran'] ?? '';
  }
}
