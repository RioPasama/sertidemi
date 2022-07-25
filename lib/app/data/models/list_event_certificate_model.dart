class ListEventCertificateModel {
  String? idassessmentSertifikat;
  String? namaAssessment;
  String? namaDaftar;
  String? tglInputTime;
  String? urlSertifikatDepanTemplate;
  String? linkSertifikat;

  ListEventCertificateModel(
      {this.idassessmentSertifikat,
      this.namaAssessment,
      this.namaDaftar,
      this.tglInputTime,
      this.linkSertifikat,
      this.urlSertifikatDepanTemplate});

  ListEventCertificateModel.fromJson(Map<String, dynamic> json) {
    idassessmentSertifikat = json['idevent_sertifikat'] ?? '';
    namaAssessment = json['nama_event'] ?? '';
    namaDaftar = json['nama_daftar'] ?? '';
    tglInputTime = json['tanggal_input'] ?? '0000-00-00 00:00:00';
    urlSertifikatDepanTemplate = json['url_sertifikat_depan_template'] ?? '';
    linkSertifikat = json['link_sertifikat'] ?? '';
  }
}
