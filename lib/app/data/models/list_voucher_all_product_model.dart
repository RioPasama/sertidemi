class ListVoucherAllProductModel {
  String? idVoucher;
  String? namaVoucher;
  String? deskripsiVoucher;
  String? jenisPotongan;
  String? nilaiPotongan;
  String? tanggalSelesai;
  String? qtyVoucherSisa;

  ListVoucherAllProductModel(
      {this.idVoucher,
      this.namaVoucher,
      this.deskripsiVoucher,
      this.jenisPotongan,
      this.nilaiPotongan,
      this.tanggalSelesai,
      this.qtyVoucherSisa});

  ListVoucherAllProductModel.fromJson(Map<String, dynamic> json) {
    idVoucher = json['idtransaksi_voucher_mandiri'] ?? '';
    namaVoucher = json['nama_voucher'] ?? '';
    deskripsiVoucher = json['deskripsi_voucher'] ?? '';
    jenisPotongan = json['jenis_potongan'] ?? '';
    nilaiPotongan = json['nilai_potongan'] ?? '';
    tanggalSelesai = json['tanggal_selesai'] ?? '';
    qtyVoucherSisa = json['qty_voucher_sisa'] ?? '';
  }
}
