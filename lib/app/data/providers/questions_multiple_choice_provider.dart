import 'package:sertidemi/app/data/models/questions_multiple_choice_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class QuestionsMultipleChoiceProvider {
  static Future<List<QuestionsMultipleChoiceModel>> getAssessmentQuestions(
      {required dynamic idassessment}) async {
    dynamic result = await MainProvider.getAPI(
        url: 'assessment_questions_pilgan.php',
        body: {'idassessment': idassessment});

    return List<QuestionsMultipleChoiceModel>.from(
        result.data.map((e) => QuestionsMultipleChoiceModel.fromJson(e)));
  }
}
