class AssessmentTiketModel {
  String? idAssessment;
  String? idTransaksi;
  String? nama;
  String? namaDaftar;
  String? tanggalMulai;
  String? urlImagePanjang;
  String? deskripsi;
  AssessmentTiketModel(
      {required this.idAssessment,
      required this.idTransaksi,
      required this.nama,
      required this.namaDaftar,
      required this.tanggalMulai,
      required this.deskripsi,
      required this.urlImagePanjang});

  AssessmentTiketModel.fromJson(Map<String, dynamic> json) {
    idTransaksi = json['idtransaksi'] ?? '';
    idAssessment = json['idassessment'] ?? '';
    nama = json['nama'] ?? '';
    namaDaftar = json['nama_daftar'] ?? '';
    tanggalMulai = json['tanggal_mulai'] ?? '';
    deskripsi = json['deskripsi'] ?? '';
    urlImagePanjang = json['url_image_panjang'] ?? '';
  }
}
