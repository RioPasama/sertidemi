import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/assessment_model.dart';
import 'package:sertidemi/app/data/models/contribution_model.dart';
import 'package:sertidemi/app/data/models/event_model.dart';

class FetchAPIProductDetailsController extends GetxController {
  late Rxn<AssessmentDetailModel> assessmentDetailModel =
      Rxn<AssessmentDetailModel>();

  late Rxn<EventDetailModel> eventDetailModel = Rxn<EventDetailModel>();

  late RxList<ContributionModel> contributionModel =
      RxList<ContributionModel>();
}
