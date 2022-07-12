class CategoryMasterModel {
  String? idKategoriMaster;
  String? judulKategoriMaster;
  String? subJudulKategoriMaster;
  String? icon;
  String? color;

  CategoryMasterModel(
      {this.idKategoriMaster,
      this.judulKategoriMaster,
      this.subJudulKategoriMaster,
      this.color,
      this.icon});

  CategoryMasterModel.fromJson(Map<String, dynamic> json) {
    idKategoriMaster =
        json['idassessment_kategori_master'] ?? json['idevent_kategori_master'];
    judulKategoriMaster = json['judul_kategori_master'] ?? '';
    subJudulKategoriMaster = json['subjudul_kategori_master'] ?? '';
    icon = json['icon'] ?? '';
    color = json['color'] ?? '';
  }
}
