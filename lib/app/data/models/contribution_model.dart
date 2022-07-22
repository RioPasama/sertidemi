class ContributionModel {
  String? id;
  String? nama;
  String? icon;

  ContributionModel({this.id, this.nama, this.icon});

  ContributionModel.fromJson(Map<String, dynamic> json) {
    id = json['idsponsor'] ?? '';
    nama = json['nama_sponsor'] ?? '';
    icon = json['icon_sponsor'] ?? json['url_logo_sponsor'] ?? '';
  }
}
