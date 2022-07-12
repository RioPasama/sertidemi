class VoucherModel {
  String? idtransaksiVoucher;
  String? namaVoucher;
  String? deskripsiVoucher;
  String? jenisPotongan;
  String? nilaiPotongan;
  String? masaAktifVoucher;
  String? status;

  VoucherModel.fromJson(Map<String, dynamic> json) {
    idtransaksiVoucher = json['idtransaksi_voucher'] ?? '';
    namaVoucher = json['nama_voucher'] ?? '';
    deskripsiVoucher = json['deskripsi_voucher'] ?? '';
    jenisPotongan = json['jenis_potongan'] ?? '';
    nilaiPotongan = json['nilai_potongan'] ?? '';
    masaAktifVoucher = json['masa_aktif_voucher'] ?? '';
    status = json['status'] ?? '';
  }
}
