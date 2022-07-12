import 'package:sertidemi/app/data/models/checkout_assessment_model.dart';
import 'package:sertidemi/app/data/models/checkout_event_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class CheckoutProvider {
  static Future<CheckoutEventDetailModel> postCheckoutEvent(
      {required String id}) async {
    MainModel result =
        await MainProvider.postAPI(url: 'checkout.php', body: {'idevent': id});

    return CheckoutEventDetailModel.fromJson(result.data);
  }

  static Future<CheckoutAssessmentDetailModel> postCheckouttAssessment(
      {required String id}) async {
    MainModel result =
        await MainProvider.postAPI(url: 'checkout.php', body: {'idevent': id});

    return CheckoutAssessmentDetailModel.fromJson(result.data);
  }
}
