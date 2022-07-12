import 'package:sertidemi/app/data/models/assessment_materi_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class AssessmentMateriProvider {
  static Future<List<AssessmentMateriModel>> getAssessmentMateriTextList(
      {required String id}) async {
    MainModel result = await MainProvider.getAPI(
        url: 'assessment_materi.php',
        body: {'idassessment': id, 'tag': 'materi'});

    return List<AssessmentMateriModel>.from(
        result.data.map((e) => AssessmentMateriModel.fromJson(e)));
  }

  static Future<List<AssessmentMateriModel>> getAssessmentMateriVideoList(
      {required String id}) async {
    MainModel result = await MainProvider.getAPI(
        url: 'assessment_materi.php',
        body: {'idassessment': id, 'tag': 'video'});

    return List<AssessmentMateriModel>.from(
        result.data.map((e) => AssessmentMateriModel.fromJson(e)));
  }
}
