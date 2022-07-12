///class CheckoutAssessmentDetailModel is model for API
class CheckoutAssessmentDetailModel {
  String? idAssessment;
  String? namaAssessment;
  String? deskripsiAssessment;
  String? tanggalMulaiAssessment;
  String? tanggalBatasAssessment;
  String? urlImagePanjang;
  String? harga;
  String? diskonStatus;
  String? diskon;
  String? namaVoucher;
  String? potonganVoucher;
  String? hargaAkhir;

  /// [idAssessment], [namaAssessment], [deskripsiAssessment], [tanggalMulaiAssessment],
  /// [tanggalBatasAssessment], [urlImagePanjang], [harga],
  /// [diskonStatus], [diskon] and [namaVoucher],[potonganVoucher],[hargaAkhir] is allowed null
  ///to avoid null data from APIs
  CheckoutAssessmentDetailModel({
    this.idAssessment,
    this.namaAssessment,
    this.deskripsiAssessment,
    this.tanggalMulaiAssessment,
    this.tanggalBatasAssessment,
    this.urlImagePanjang,
    this.diskon,
    this.diskonStatus,
    this.harga,
    this.hargaAkhir,
    this.namaVoucher,
    this.potonganVoucher,
  });

  CheckoutAssessmentDetailModel.fromJson(Map<String, dynamic> json) {
    idAssessment = json['idassessment'] ?? '';
    namaAssessment = json['nama_assessment'] ?? '';
    deskripsiAssessment = json['deskripsi_assessment'] ?? '';
    tanggalMulaiAssessment = json['assessment_mulai'] ?? '';
    tanggalBatasAssessment = json['assessment_selesai'] ?? '';
    urlImagePanjang = json['url_image_panjang'] ?? '';
    harga = json['harga'] ?? '';
    diskonStatus = json['diskon_status'] ?? '';
    diskon = json['diskon'] ?? '';
    namaVoucher = json['nama_voucher'] ?? '';
    potonganVoucher = json['potongan_voucher'] ?? '';
    hargaAkhir = json['harga_akhir'] ?? '';
  }
}
