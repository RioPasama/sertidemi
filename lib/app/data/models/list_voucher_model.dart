class ListVoucherModel {
  String? idtransaksiVoucher;
  String? idproduk;
  String? namaVoucher;
  String? deskripsiVoucher;
  String? jenisPotongan;
  String? nilaiPotongan;
  String? masaAktifVoucher;
  String? status;

  ListVoucherModel(
      {this.idtransaksiVoucher,
      this.idproduk,
      this.namaVoucher,
      this.deskripsiVoucher,
      this.jenisPotongan,
      this.masaAktifVoucher,
      this.nilaiPotongan,
      this.status});

  ListVoucherModel.fromJson(Map<String, dynamic> json) {
    idtransaksiVoucher = json['idtransaksi_voucher'] ?? '';
    idproduk = json['idproduk'] ?? '';
    namaVoucher = json['nama_voucher'] ?? '';
    deskripsiVoucher = json['deskripsi_voucher'] ?? '';
    jenisPotongan = json['jenis_potongan'] ?? '';
    nilaiPotongan = json['nilai_potongan'] ?? '';
    masaAktifVoucher = json['masa_aktif_voucher'] ?? '';
    status = json['status'] ?? '';
  }
}
