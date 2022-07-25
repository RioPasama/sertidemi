class ListAssessmentCertificateModel {
  String? idassessmentSertifikat;
  String? namaAssessment;
  String? namaDaftar;
  String? tglInputTime;
  String? nilai;
  String? urlSertifikatDepanTemplate;
  String? linkSertifikat;

  ListAssessmentCertificateModel(
      {this.idassessmentSertifikat,
      this.namaAssessment,
      this.namaDaftar,
      this.tglInputTime,
      this.nilai,
      this.linkSertifikat,
      this.urlSertifikatDepanTemplate});

  ListAssessmentCertificateModel.fromJson(Map<String, dynamic> json) {
    idassessmentSertifikat = json['idassessment_sertifikat'] ?? '';
    namaAssessment = json['nama_assessment'] ?? '';
    namaDaftar = json['nama_daftar'] ?? '';
    tglInputTime = json['tgl_input_time'] ?? '';
    nilai = json['nilai'] ?? '';
    urlSertifikatDepanTemplate = json['url_sertifikat_depan_template'] ?? '';
    linkSertifikat = json['link_sertifikat'] ?? '';
  }
}
