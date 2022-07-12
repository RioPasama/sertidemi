class HomeBannerModel {
  String? idBanner;
  String? namaBanner;
  String? imageBanner;

  /// [idBanner], [namaBanner] and [imageBanner] is allowed null
  ///to avoid null data from APIs
  HomeBannerModel({this.idBanner, this.namaBanner, this.imageBanner});

  HomeBannerModel.fromJson(Map<String, dynamic> json) {
    idBanner = json['idbanner'];
    namaBanner = json['nama_banner'];
    imageBanner = json['file_banner'];
  }
}
