class ListCertificateModel {
  String? idassessmentSertifikat;
  String? namaAssessment;
  String? tglInputTime;
  String? nilai;
  String? urlSertifikatDepanTemplate;
  String? linkSertifikat;

  ListCertificateModel(
      {this.idassessmentSertifikat,
      this.namaAssessment,
      this.tglInputTime,
      this.nilai,
      this.linkSertifikat,
      this.urlSertifikatDepanTemplate});

  ListCertificateModel.fromJson(Map<String, dynamic> json) {
    idassessmentSertifikat = json['idassessment_sertifikat'] ?? '';
    namaAssessment = json['nama_assessment'] ?? '';
    tglInputTime = json['tgl_input_time'] ?? '';
    nilai = json['nilai'] ?? '';
    urlSertifikatDepanTemplate = json['url_sertifikat_depan_template'] ?? '';
    linkSertifikat = json['link_sertifikat'] ?? '';
  }
}
