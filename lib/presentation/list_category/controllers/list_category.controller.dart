import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/category_master_model.dart';
import 'package:sertidemi/app/data/models/category_model.dart';
import 'package:sertidemi/app/data/providers/category_provider.dart';

class ListCategoryController extends GetxController {
  late RxList<CategoryMasterModel> categoryMasterModel =
      RxList<CategoryMasterModel>();
  late RxList<CategoryModel> categoryModel = RxList<CategoryModel>();

  Map<String, dynamic> getArguments = Get.arguments;
  RxString title = ''.obs;
  RxString tag = ''.obs;
  RxString idCategoryMaster = ''.obs;
  RxInt indexCategoryMaster = 0.obs;
  RxInt initialLoadSubCategory = 0.obs;
  RxBool openSearch = false.obs;
  RxBool isEmptyData = false.obs;

  @override
  void onInit() {
    initialLoadSubCategory.value = 0;
    indexCategoryMaster.value = getArguments['index'];
    setTitle();
    setTagCategoryMaster();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onTapSearch(String value) async {
    // categoryModel.value = await CategoryProvider.getCategorySub(
    //     idCategory: idCategoryMaster.value, tag: tag.value, q: value);
    categoryModel.clear();
    categoryModel.value = await CategoryProvider.getCategorySubSearch(
        idCategory: idCategoryMaster.value, tag: tag.value, q: value);
    if (categoryModel.isEmpty) {
      isEmptyData.value = true;
    } else {
      isEmptyData.value = false;
    }
  }

  void setTitle() {
    if (getArguments['option'] == 1) {
      title.value = 'Event Category';
    } else {
      title.value = 'Certification Category';
    }
  }

  void onTapCategoryMaster({required int index}) async {
    categoryModel.value = [];
    isEmptyData.value = false;
    indexCategoryMaster.value = index;
    // setSubCategory();
    idCategoryMaster.value =
        categoryMasterModel[indexCategoryMaster.value].idKategoriMaster!;

    categoryModel.value = await CategoryProvider.getCategorySub(
        idCategory: idCategoryMaster.value, tag: tag.value);
  }

  void setSubCategory() async {
    if (initialLoadSubCategory.value == 0) {
      idCategoryMaster.value =
          categoryMasterModel[indexCategoryMaster.value].idKategoriMaster!;
      categoryModel.value = await CategoryProvider.getCategorySub(
          idCategory: idCategoryMaster.value, tag: tag.value);
      initialLoadSubCategory.value = 1;

      if (categoryModel.isEmpty) {
        isEmptyData.value = true;
      } else {
        isEmptyData.value = false;
      }
    }
  }

  void setTagCategoryMaster() {
    if (getArguments['option'] == 1) {
      tag.value = 'event';
    } else {
      tag.value = 'assessment';
    }
  }
}
