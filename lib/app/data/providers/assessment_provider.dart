import 'dart:async';
import 'package:sertidemi/app/data/models/assessment_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

///Fetch data from api to model
class AssessmentProvider {
  ///Fetch data getListAssesment
  ////tag:
  ///semua
  ///sertifikasi
  ///materi
  ///video
  static Future<List<ProductModel>> getListAssesment(
      {String? q = '',
      int offset = 0,
      String tag = '',
      required String idaAssessmentKategori}) async {
    MainModel result = await MainProvider.getAPI(url: 'assessment.php', body: {
      'tag': tag,
      'limit': '20',
      'offset': offset.toString(),
      'idassessment_kategori': idaAssessmentKategori,
      'q': q,
    });

    return List<ProductModel>.from(
        result.data.map((e) => ProductModel.fromJson(e)));
  }

  ///Fetch data getDetailAssesment
  static Future<AssessmentDetailModel> getDetailAssesment(
      {required String idAssessment}) async {
    MainModel result = await MainProvider.getAPI(
        url: 'assessment.php', body: {'idassessment': idAssessment});

    return AssessmentDetailModel.fromJson(result.data);
  }
}
