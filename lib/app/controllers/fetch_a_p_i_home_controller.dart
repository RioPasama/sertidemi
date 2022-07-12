import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/category_master_model.dart';
import 'package:sertidemi/app/data/models/home_banner_model.dart';
import 'package:sertidemi/app/data/providers/category_provider.dart';
import 'package:sertidemi/app/data/providers/home_provider.dart';

class FetchAPIHomeController extends GetxController {
  RxList<FetchModel> dataHomeListProduct = RxList<FetchModel>();
  RxList<CategoryMasterModel> categoryMaster = RxList<CategoryMasterModel>();
  RxList<HomeBannerModel> homeBannerModel = RxList<HomeBannerModel>();

  RxBool isLoadingDataHomeListProduct = true.obs;
  RxBool isLoadingCategoryMaster = true.obs;
  RxBool isLoadingHomeBannerModel = true.obs;

  void fetchHomeListProduct() {
    HomeProvider.getHomeListProduct().then((value) {
      dataHomeListProduct.value = value;
      isLoadingDataHomeListProduct.value = false;
    });
  }

  void fetchHomeCategoryMaster() {
    CategoryProvider.getCategoryMaster(tag: 'assessment').then((value) {
      categoryMaster.value = value;
      isLoadingCategoryMaster.value = false;
    });
  }

  void fetchHomeBanner() {
    HomeProvider.getHomeBanner().then((value) {
      homeBannerModel.value = value;
      isLoadingHomeBannerModel.value = false;
    });
  }
}
