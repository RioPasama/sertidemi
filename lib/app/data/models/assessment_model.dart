///class AssessmentDetailModel is model for API
class AssessmentDetailModel {
  String? idAssessment;
  String? namaAssessment;
  String? deskripsiAssessment;
  String? tanggalMulaiAssessment;
  String? tanggalBatasAssessment;
  String? urlSertifikatDepanTemplate;
  String? urlImagePanjang;
  String? hargaAssessment;
  String? diskonAssessment;
  String? hargaDiskon;
  dynamic urlLogoSponsor;
  String? penulis;
  String? waktuPengerjaan;
  String? tampilAssessmentEssay;
  String? tampilAssessmentPilgan;
  String? statusMateri;

  /// [idAssessment], [namaAssessment], [deskripsiAssessment], [tanggalMulaiAssessment],
  /// [tanggalBatasAssessment], [urlSertifikatDepanTemplate], [hargaAssessment],
  /// [diskonAssessment], [hargaDiskon] and [urlLogoSponsor] is allowed null
  ///to avoid null data from APIs
  AssessmentDetailModel(
      {this.idAssessment,
      this.namaAssessment,
      this.deskripsiAssessment,
      this.tanggalMulaiAssessment,
      this.tanggalBatasAssessment,
      this.urlSertifikatDepanTemplate,
      this.urlImagePanjang,
      this.hargaAssessment,
      this.diskonAssessment,
      this.hargaDiskon,
      this.urlLogoSponsor,
      this.waktuPengerjaan,
      this.tampilAssessmentEssay,
      this.tampilAssessmentPilgan,
      this.statusMateri,
      this.penulis});

  AssessmentDetailModel.fromJson(Map<String, dynamic> json) {
    idAssessment = json['idassessment'] ?? '';
    namaAssessment = json['nama_assessment'] ?? '';
    deskripsiAssessment = json['deskripsi_assessment'] ?? '';
    tanggalMulaiAssessment = json['tanggal_mulai_assessment'] ?? '';
    tanggalBatasAssessment = json['tanggal_batas_assessment'] ?? '';
    urlSertifikatDepanTemplate = json['url_sertifikat_depan_template'] ?? '';
    urlImagePanjang = json['url_image_panjang'] ?? '';
    hargaAssessment = json['harga_assessment'] ?? '';
    deskripsiAssessment = json['diskon_assessment'] ?? '';
    hargaDiskon = json['harga_diskon'] ?? '';
    penulis = json['penulis'] ?? '';
    waktuPengerjaan = json['waktu_pengerjaan'] ?? '';
    tampilAssessmentEssay = json['tampil_assessment_essay'];
    tampilAssessmentPilgan = json['tampil_assessment_pilgan'];
    statusMateri = json['status_materi'];
  }
}
