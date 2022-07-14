import 'package:sertidemi/app/data/models/materi_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class MateriProvider {
  static Future<List<MateriModel>> getEventMateriTextList(
      {required String id}) async {
    MainModel result = await MainProvider.getAPI(
        url: 'event_materi.php', body: {'idevent': id, 'tag': 'materi'});

    return List<MateriModel>.from(
        result.data.map((e) => MateriModel.fromJson(e)));
  }

  static Future<List<MateriModel>> getEventMateriVideoList(
      {required String id}) async {
    MainModel result = await MainProvider.getAPI(
        url: 'event_materi.php', body: {'idevent': id, 'tag': 'video'});

    return List<MateriModel>.from(
        result.data.map((e) => MateriModel.fromJson(e)));
  }

  static Future<List<MateriModel>> getAssessmentMateriTextList(
      {required String id}) async {
    MainModel result = await MainProvider.getAPI(
        url: 'assessment_materi.php',
        body: {'idassessment': id, 'tag': 'materi'});

    return List<MateriModel>.from(
        result.data.map((e) => MateriModel.fromJson(e)));
  }

  static Future<List<MateriModel>> getAssessmentMateriVideoList(
      {required String id}) async {
    MainModel result = await MainProvider.getAPI(
        url: 'assessment_materi.php',
        body: {'idassessment': id, 'tag': 'video'});

    return List<MateriModel>.from(
        result.data.map((e) => MateriModel.fromJson(e)));
  }
}
