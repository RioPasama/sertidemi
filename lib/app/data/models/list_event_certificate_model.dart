class ListEventCertificateModel {
  String? idassessmentSertifikat;
  String? namaAssessment;
  String? tglInputTime;
  String? urlSertifikatDepanTemplate;
  String? linkSertifikat;

  ListEventCertificateModel(
      {this.idassessmentSertifikat,
      this.namaAssessment,
      this.tglInputTime,
      this.linkSertifikat,
      this.urlSertifikatDepanTemplate});

  ListEventCertificateModel.fromJson(Map<String, dynamic> json) {
    idassessmentSertifikat = json['idevent_sertifikat'] ?? '';
    namaAssessment = json['nama_event'] ?? '';
    tglInputTime = json['tanggal_input'] ?? '0000-00-00 00:00:00';
    urlSertifikatDepanTemplate = json['url_sertifikat_depan_template'] ?? '';
    linkSertifikat = json['link_sertifikat'] ?? '';
  }
}
