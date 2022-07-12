import 'dart:async';
import 'package:sertidemi/app/data/models/category_master_model.dart';
import 'package:sertidemi/app/data/models/category_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

///Fetch data from api to model
class CategoryProvider {
  ///Fetch data getCategoryMasterAssesment
  static Future<List<CategoryMasterModel>> getCategoryMaster(
      {required String tag}) async {
    MainModel result =
        await MainProvider.getAPI(url: 'category_master.php', body: {
      'tag': tag,
    });

    return List<CategoryMasterModel>.from(
        result.data.map((e) => CategoryMasterModel.fromJson(e)));
  }

  ///Fetch data getCategoryMasterEvent
  static Future<List<CategoryModel>> getCategorySub(
      {required String idCategory, required String tag}) async {
    MainModel result = await MainProvider.getAPI(
        url: 'category_master.php',
        body: {'tag': tag, 'idkategori': idCategory});

    return List<CategoryModel>.from(
        result.data.map((e) => CategoryModel.fromJson(e)));
  }

  ///Fetch data getCategoryMasterEvent
  static Future<List<CategoryModel>> getCategorySubSearch(
      {required String idCategory,
      required String tag,
      required String q}) async {
    MainModel result = await MainProvider.getAPI(
        url: 'category.php', body: {'id': tag, 'q': q, 'idmaster': idCategory});

    return List<CategoryModel>.from(
        result.data.map((e) => CategoryModel.fromJson(e)));
  }
}
