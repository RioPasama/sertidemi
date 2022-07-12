///class CategoryModel is model for API
///
///CategoryModel the use for event and assessment
class CategoryModel {
  String? idkategori;
  String? namakategori;
  String? icon;

  /// [idkategori], [namakategori] and [icon] is allowed null
  ///to avoid null data from APIs
  CategoryModel({this.idkategori, this.namakategori, this.icon});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    idkategori =
        json['dievent_kategori'] ?? json['idassessment_kategori'] ?? '';
    namakategori = json['nama_kategori'] ?? '';
    icon = json['icon'] ?? '';
  }
}
