import 'package:sertidemi/app/data/models/contribution_model.dart';

class AssessmentDetailTiketModel {
  String? idassessment;
  String? idtransaksi;
  String? namaAssessment;
  String? deskripsiAssessment;
  String? tanggalMulaiAssessment;
  String? tanggalBatasAssessment;
  String? urlSertifikatDepanTemplate;
  String? urlImagePanjang;
  String? hargaAssessment;
  String? diskonAssessment;
  String? hargaDiskon;
  String? tampilAssessmentPilgan;
  String? tampilAssessmentEssay;
  String? penulis;
  String? statusMateri;
  String? statusLulus;
  String? statusPengerjaan;
  String? waktuPengerjaan;
  List<ContributionModel>? contribution;

  AssessmentDetailTiketModel(
      {required this.idassessment,
      required this.idtransaksi,
      required this.namaAssessment,
      required this.deskripsiAssessment,
      required this.diskonAssessment,
      required this.hargaAssessment,
      required this.hargaDiskon,
      required this.penulis,
      required this.statusMateri,
      required this.urlImagePanjang,
      required this.tampilAssessmentEssay,
      required this.tampilAssessmentPilgan,
      required this.tanggalBatasAssessment,
      required this.tanggalMulaiAssessment,
      required this.contribution,
      required this.statusLulus,
      required this.statusPengerjaan,
      required this.waktuPengerjaan,
      required this.urlSertifikatDepanTemplate});

  AssessmentDetailTiketModel.fromJson(Map<String, dynamic> json) {
    idassessment = json['idassessment'] ?? '';
    idtransaksi = json['idtransaksi'] ?? '';
    namaAssessment = json['nama_assessment'] ?? '';
    deskripsiAssessment = json['deskripsi_assessment'] ?? '';
    urlSertifikatDepanTemplate = json['url_sertifikat_depan_template'] ?? '';
    tanggalMulaiAssessment = json['tanggal_mulai_assessment'] ?? '';
    tanggalBatasAssessment = json['tanggal_batas_assessment'] ?? '';
    hargaAssessment = json['harga_assessment'] ?? '';
    diskonAssessment = json['diskon_assessment'] ?? '';
    hargaDiskon = json['harga_diskon'] ?? '';
    tampilAssessmentPilgan = json['tampil_assessment_pilgan'];
    tampilAssessmentEssay = json['tampil_assessment_essay'];
    penulis = json['penulis'];
    statusMateri = json['status_materi'];
    statusLulus = json['status_lulus'];
    statusPengerjaan = json['status_pengerjaan'];
    waktuPengerjaan = json['waktu_pengerjaan'];
    urlImagePanjang = json['url_image_panjang'];
    contribution = List<ContributionModel>.from(
        json['sponsor'].map((e) => ContributionModel.fromJson(e)));
    ;
  }
}
