class AsessmentAnswerModel {
  String? idAssessment;
  String? namaAssessment;
  String? nilai;
  String? hasil;
  String? comment;
  String? submitAt;
  String? namaSertifikat;
  String? namaUser;
  String? duration;

  AsessmentAnswerModel({
    required this.idAssessment,
    required this.comment,
    required this.namaAssessment,
    required this.nilai,
    required this.hasil,
    required this.namaSertifikat,
    required this.namaUser,
    required this.duration,
    required this.submitAt,
  });
  AsessmentAnswerModel.fromJson(Map<String, dynamic> json) {
    idAssessment = json['idassessment'] ?? '';
    namaAssessment = json['nama_assessment'] ?? '';
    nilai = json['nilai'] ?? '';
    comment = json['comment'] ?? '';
    hasil = json['hasil'] ?? '';
    submitAt = json['submit_at'] ?? '';
    duration = json['duration'] ?? '';
    namaUser = json['nama_user'] ?? '';
    namaSertifikat = json['nama_sertifikat'] ?? '';
  }
}
