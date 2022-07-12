import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/assessment_materi_model.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';

import 'controllers/materi.controller.dart';

class MateriScreen extends GetView<MateriController> {
  @override
  final MateriController controller = Get.put(MateriController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(color: primaryColor),
        SafeArea(
            child: Container(
          color: Colors.white,
        )),
        SafeArea(
          child: Obx(() => ListView.builder(
                itemCount: (controller.indexCategoryMateri.value == 0)
                    ? controller.assessmentMateriTextModel.length
                    : controller.assessmentMateriVideoModel.length,
                padding: const EdgeInsets.only(left: 16, right: 16, top: 120),
                itemBuilder: (context, index) {
                  return (controller.indexCategoryMateri.value == 0)
                      ? cardMateriText(index,
                          assessmentMateriModel:
                              controller.assessmentMateriTextModel)
                      : cardMatriVideo(index,
                          assessmentMateriModel:
                              controller.assessmentMateriVideoModel);
                },
              )),
        ),
        appBar(),
        SafeArea(
            child: Container(
          height: 50,
          margin: const EdgeInsets.only(top: 68),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            scrollDirection: Axis.horizontal,
            children: [
              cardListCategory(index: 0, title: 'Text'),
              cardListCategory(index: 1, title: 'Video')
            ],
          ),
        ))
      ],
    ));
  }

  Widget cardListCategory({
    required int index,
    required String title,
  }) {
    return Obx(() => GestureDetector(
          onTap: () => controller.onTapMateri(index: index),
          child: Container(
            height: 50,
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              height: 40,
              width: Get.width / 2 - (16 * 2),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: (controller.indexCategoryMateri.value == index)
                      ? Colors.white
                      : Colors.grey,
                  border: Border.all(
                      width: 2,
                      color: (controller.indexCategoryMateri.value == index)
                          ? primaryColor
                          : Colors.grey),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4,
                        offset: Offset(0, 2))
                  ]),
              child: Text(
                title,
                style: textBold.copyWith(
                    fontSize: 16,
                    color: (controller.indexCategoryMateri.value == index)
                        ? Colors.black
                        : Colors.black54),
              ),
            ),
          ),
        ));
  }

  Widget cardMatriVideo(int index,
      {required List<AssessmentMateriModel> assessmentMateriModel}) {
    return GestureDetector(
      onTap: () =>
          controller.onTapVideo(assessmentMateriModel[index].linkMateri!),
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  assessmentMateriModel[index].deskripsiMateri!,
                  style: textBold.copyWith(fontSize: 16),
                ),
                // Text(assessmentMateriModel[index].keterangan!)
              ],
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardMateriText(int index,
      {required List<AssessmentMateriModel> assessmentMateriModel}) {
    return GestureDetector(
      onTap: () => controller.requestDownload(
          assessmentMateriModel[index].linkMateri!,
          namefile: assessmentMateriModel[index].deskripsiMateri!),
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  assessmentMateriModel[index].deskripsiMateri!,
                  style: textBold.copyWith(fontSize: 16),
                ),
                Text(assessmentMateriModel[index].keterangan!)
              ],
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Image.asset(
                    Assets.icons.unggalGambarMateri.assetName,
                    scale: 3,
                  ),
                  const Text(
                    'Unduh',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SafeArea appBar() {
    return SafeArea(
      child: Container(
        height: 90,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(18)),
            color: primaryColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
              Text(
                'Materi ${controller.getArguments['titleHeader']}',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(width: 30)
            ],
          ),
        ),
      ),
    );
  }
}
