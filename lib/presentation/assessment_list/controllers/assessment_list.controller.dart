import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/app/data/providers/assessment_provider.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';

class AssessmentListController extends GetxController {
  final ScrollController scrollController = ScrollController();

  late RxList<ProductModel> productModel = RxList<ProductModel>();
  late TextEditingController search;
  int limit = 10;

  Map<String, dynamic> getArguments = Get.arguments;
  RxInt initialShowDialog = 0.obs;
  RxBool isSearch = false.obs;

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    search.dispose();
  }

  // void onTapToDetailAssessment(
  //     {required String idAssessment,
  //     required String urlSertifikatDepanTemplate}) {
  //   Map<String, dynamic> sendArguments = {
  //     'idAssessment': idAssessment,
  //     'urlSertifikatDepanTemplate': urlSertifikatDepanTemplate
  //   };

  //   Get.toNamed(Routes.ASSESSMENT_DETAIL, arguments: sendArguments);
  // }

  void onTapFilter() {
    Get.dialog(Dialog(
      backgroundColor: Colors.transparent,
      insetPadding:
          EdgeInsets.only(left: 80, bottom: (Get.height / 3), right: 16),
      child: SafeArea(
        child: Container(
          height: 300,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: primaryColor, width: 2),
              borderRadius: BorderRadius.circular(18)),
          child: Column(
            children: [
              // Value = 3
              GestureDetector(
                onTap: (() => onTapListFilter(3)),
                child: Container(
                  width: 216,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      color: (initialShowDialog.value == 3)
                          ? primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(0, 2))
                      ]),
                  child: Text(
                    'Sertifikasi',
                    style: TextStyle(
                        fontSize: 16,
                        color: (initialShowDialog.value == 3)
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),

              // Value = 2
              GestureDetector(
                onTap: (() => onTapListFilter(2)),
                child: Container(
                  width: 216,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      color: (initialShowDialog.value == 2)
                          ? primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(0, 2))
                      ]),
                  child: Text(
                    'Sertifikasi + Materi',
                    style: TextStyle(
                        fontSize: 16,
                        color: (initialShowDialog.value == 2)
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),

              // Value = 1
              GestureDetector(
                onTap: (() => onTapListFilter(1)),
                child: Container(
                  width: 216,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      color: (initialShowDialog.value == 1)
                          ? primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(0, 2))
                      ]),
                  child: Text(
                    'Sertifikasi + Video Materi',
                    style: TextStyle(
                        fontSize: 16,
                        color: (initialShowDialog.value == 1)
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),

              // Value = 0
              GestureDetector(
                onTap: (() => onTapListFilter(0)),
                child: Container(
                  width: 216,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      color: (initialShowDialog.value == 0)
                          ? primaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(0, 2))
                      ]),
                  child: Text(
                    'Semua',
                    style: TextStyle(
                        fontSize: 16,
                        color: (initialShowDialog.value == 0)
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void onTapListFilter(int value) async {
    RxString tag = ''.obs;

    tag.value = tagListFilter(value);

    search.text = '';
    Get.back();

    initialShowDialog.value = value;

    productModel.value = await AssessmentProvider.getListAssesment(
        idaAssessmentKategori: getArguments['idkategori'],
        offset: 0,
        tag: tag.value);
  }

  String tagListFilter(int value) {
    RxString tag = ''.obs;
    //value 0 = Semua
    //value 1 = Sertifikasi + video Materi
    //value 2 = Sertifikasi + Materi
    //value 3 = Sertifikasi

    switch (value) {
      case 0:
        tag.value = 'All';
        break;
      case 1:
        tag.value = 'Video';
        break;
      case 2:
        tag.value = 'Text File';
        break;
      case 3:
        tag.value = 'Certification';
        break;
      default:
    }

    return tag.value;
  }

  void onTapSearch(String value) async {
    RxString tag = ''.obs;

    tag.value = tagListFilter(initialShowDialog.value);
    productModel.value = await AssessmentProvider.getListAssesment(
        idaAssessmentKategori: getArguments['idkategori'],
        offset: 0,
        q: value,
        tag: tag.value);

    isSearch.value = true;
  }

  void onResetSearc() async {
    productModel.value = await AssessmentProvider.getListAssesment(
        idaAssessmentKategori: getArguments['idkategori']);
    search.text = '';
    isSearch.value = false;
  }

  void onScroll() async {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    RxString tag = ''.obs;

    tag.value = tagListFilter(initialShowDialog.value);

    if (currentScroll == maxScroll) {
      List<ProductModel> onScrollProductModel =
          await AssessmentProvider.getListAssesment(
              idaAssessmentKategori: getArguments['idkategori'],
              offset: limit,
              tag: tag.value,
              q: search.text);

      productModel.value += onScrollProductModel;
      limit = limit * 2;
    }
  }
}
