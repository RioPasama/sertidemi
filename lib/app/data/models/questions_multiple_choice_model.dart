class QuestionsMultipleChoiceModel {
  dynamic idassessmentSoalPilgan;
  String? soalText;
  String? soalGambar;
  String? pilihanAText;
  String? pilihanAGambar;
  String? pilihanBText;
  String? pilihanBGambar;
  String? pilihanCText;
  String? pilihanCGambar;
  String? pilihanDText;
  String? pilihanDGambar;
  String? jawaban;
  String? penjelasanJawaban;

  QuestionsMultipleChoiceModel(
      {this.idassessmentSoalPilgan,
      this.soalText,
      this.soalGambar,
      this.pilihanAText,
      this.pilihanAGambar,
      this.pilihanBText,
      this.pilihanBGambar,
      this.pilihanCText,
      this.pilihanCGambar,
      this.pilihanDText,
      this.pilihanDGambar,
      this.jawaban,
      this.penjelasanJawaban});

  QuestionsMultipleChoiceModel.fromJson(Map<String, dynamic> json) {
    idassessmentSoalPilgan = json['idassessment_soal_pilgan'] ?? '';
    soalText = json['soal_text'] ?? '';
    soalGambar = json['soal_gambar'] ?? '';
    soalGambar = json['soal_gambar'] ?? '';
    pilihanAText = json['pilihan_a_text'] ?? '';
    pilihanAGambar = json['pilihan_a_gambar'] ?? '';
    pilihanBText = json['pilihan_b_text'] ?? '';
    pilihanBGambar = json['pilihan_b_gambar'] ?? '';
    pilihanCText = json['pilihan_c_text'] ?? '';
    pilihanCGambar = json['pilihan_c_gambar'] ?? '';
    pilihanDText = json['pilihan_d_text'] ?? '';
    pilihanDGambar = json['pilihan_d_gambar'] ?? '';
    jawaban = json['jawaban'] ?? '';
    penjelasanJawaban = json['penjelasan_jawaban'] ?? '';
  }
}
