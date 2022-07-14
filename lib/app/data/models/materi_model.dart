class MateriModel {
  String? idMateri;
  String? linkMateri;
  String? linkStatus;
  String? keterangan;
  String? deskripsiMateri;

  MateriModel.fromJson(Map<String, dynamic> json) {
    idMateri = json['idevent_materi'] ?? json['idassessment_materi'] ?? '';
    linkMateri = json['link_materi'] ?? '';
    linkStatus = json['link_status'] ?? '';
    keterangan = json['keterangan'] ?? '';
    deskripsiMateri = json['deskripsi_materi'] ?? '';
  }
}
