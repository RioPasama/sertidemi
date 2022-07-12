class AssessmentMateriModel {
  String? idassessmentMateri;
  String? linkMateri;
  String? linkStatus;
  String? keterangan;
  String? deskripsiMateri;

  AssessmentMateriModel.fromJson(Map<String, dynamic> json) {
    idassessmentMateri = json['idassessment_materi'] ?? '';
    linkMateri = json['link_materi'] ?? '';
    linkStatus = json['link_status'] ?? '';
    keterangan = json['keterangan'] ?? '';
    deskripsiMateri = json['deskripsi_materi'] ?? '';
  }
}
