class AssessmentTiketModel {
  String? idAssessment;
  String? idTransaksi;
  String? nama;
  String? tanggalMulai;
  String? urlImagePanjang;
  String? deskripsi;
  AssessmentTiketModel(
      {required this.idAssessment,
      required this.idTransaksi,
      required this.nama,
      required this.tanggalMulai,
      required this.deskripsi,
      required this.urlImagePanjang});

  AssessmentTiketModel.fromJson(Map<String, dynamic> json) {
    idTransaksi = json['idtransaksi'] ?? '';
    idAssessment = json['idassessment'] ?? '';
    nama = json['nama'] ?? '';
    tanggalMulai = json['tanggal_mulai'] ?? '';
    deskripsi = json['deskripsi'] ?? '';
    urlImagePanjang = json['url_image_panjang'] ?? '';
  }
}
