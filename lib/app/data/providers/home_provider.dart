import 'dart:async';
import 'package:sertidemi/app/data/models/home_banner_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

///Fetch data from api to model
class HomeProvider {
  ///Fetch data getHomeListProduct
  static Future<List<FetchModel>> getHomeListProduct() async {
    MainModel result = await MainProvider.getAPI(url: 'home.php');

    return List<FetchModel>.from(
        result.data.map((e) => FetchModel.fromJson(e)));
  }

  ///Fetch data getHomeListProduct
  // static Future<List<CategoryMaster>> getHomeCategoryMaster(String tag) async {
  //   MainModel result = await MainProvider.getAPI(
  //       url: 'category_master.php', body: {'tag': tag});

  //   return List<CategoryMaster>.from(
  //       result.data.map((e) => CategoryMaster.fromJson(e)));
  // }

  ///Fetch data getHomeListProduct
  static Future<List<HomeBannerModel>> getHomeBanner() async {
    MainModel result = await MainProvider.getAPI(url: 'home_banner.php');

    return List<HomeBannerModel>.from(
        result.data.map((e) => HomeBannerModel.fromJson(e)));
  }

  static Future<List<ProductModel>> getHomeSearch(
      String q, String offset) async {
    MainModel result = await MainProvider.getAPI(
        url: 'home.php', body: {'q': q, 'offset': offset});

    return List<ProductModel>.from(
        result.data.map((e) => ProductModel.fromJson(e)));
  }
}

class FetchModel {
  String? nama;
  List<ProductModel>? data;
  String? url;
  FetchModel({String? nama, List<ProductModel>? data});

  FetchModel.fromJson(Map<String, dynamic> json) {
    nama = json['nama'] ?? '';
    url = json['url'] ?? '';
    data = List<ProductModel>.from(
        json['data'].map((e) => ProductModel.fromJson(e)));
  }
}
