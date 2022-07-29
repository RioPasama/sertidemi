class DetailTransactionModel {
  String? idTransaksi;
  String? invoice;
  String? jenisTransaksi;
  String? statusTransaksi;
  String? tanggalInput;
  String? deskripsi;
  String? batasPembayaran;
  String? totalPembayaran;
  String? totalHargaTicketAkhir;
  String? potonganVoucher;
  String? nama;
  String? namaSertifikat;
  String? urlImagePanjang;
  String? urlImageKotak;
  String? paymentType;
  String? nomorPayment;
  String? tanggalDibayar;

  DetailTransactionModel(
      {this.idTransaksi,
      this.invoice,
      this.jenisTransaksi,
      this.statusTransaksi,
      this.tanggalInput,
      this.deskripsi,
      this.batasPembayaran,
      this.nama,
      this.namaSertifikat,
      this.tanggalDibayar,
      this.paymentType,
      this.totalPembayaran,
      this.nomorPayment,
      this.urlImageKotak,
      this.urlImagePanjang});

  DetailTransactionModel.fromJson(Map<String, dynamic> json) {
    idTransaksi = json['idtransaksi'] ?? '';
    invoice = json['invoice'] ?? '';
    deskripsi = json['deskripsi'] ?? '';
    jenisTransaksi = json['jenis_transaksi'] ?? '';
    statusTransaksi = json['status_transaksi'] ?? '';
    batasPembayaran = json['batas_pembayaran'] ?? '';
    tanggalInput = json['tanggal_input'] ?? '';
    nomorPayment = json['nomor_payment'] ?? '';
    totalPembayaran = json['total_pembayaran'] ?? '';
    totalHargaTicketAkhir = json['total_harga_ticket_akhir'] ?? '';
    potonganVoucher = json['potongan_voucher'] ?? '';
    tanggalDibayar = json['tanggal_dibayar'] ?? '';
    nama = json['nama'] ?? '';
    namaSertifikat = json['nama_sertifikat'] ?? '';
    urlImagePanjang = json['url_image_panjang'] ?? '';
    urlImageKotak = json['url_image_kotak'] ?? '';
    paymentType = json['payment_type'] ?? '';
  }
}
