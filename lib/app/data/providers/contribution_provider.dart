import 'package:sertidemi/app/data/models/contribution_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class ContributionProvider {
  static Future<List<ContributionModel>> getListContribution(
      {required String id}) async {
    MainModel result =
        await MainProvider.getAPI(url: 'sponsor.php', body: {'id': id});

    return List<ContributionModel>.from(
        result.data.map((e) => ContributionModel.fromJson(e)));
  }
}
