import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/domain/core/extensions/currencyFormat.extention.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/infrastructure/theme/widget_decoration.theme.dart';
import 'package:sertidemi/presentation/register_assessment/controllers/register_assessment.controller.dart';

class RegisterAssessmentContentView extends GetView {
  @override
  final RegisterAssessmentController controller =
      Get.put(RegisterAssessmentController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20, bottom: 60, left: 16, right: 16),
      children: [
        cardBanner(controller.fetchAPIProductDetailsController
            .assessmentDetailModel.value!.urlImagePanjang!),
        header(),
        price(),
        const SizedBox(height: 10),
        description(),
        const Divider(),
        inputName(),
      ],
    );
  }

  Widget inputName() {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name', style: textBold),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller.nameTextEditingController,
            decoration: inputInputDecorationRounded,
            validator: (val) {
              return controller.validatorName(val);
            },
          ),
          const Text(
              '*Please write your name correctly and will be place on certificate'),
        ],
      ),
    );
  }

  Text description() {
    return Text(
      controller.fetchAPIProductDetailsController.assessmentDetailModel.value!
          .deskripsiAssessment!,
      maxLines: 7,
      overflow: TextOverflow.clip,
    );
  }

  Row price() {
    return Row(
      children: [
        Container(
          height: 28,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(8)),
          child: Text(
            currencyRp(controller.fetchAPIProductDetailsController
                .assessmentDetailModel.value!.hargaAssessment!
                .toString()),
            style: textBold.copyWith(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Padding header() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.fetchAPIProductDetailsController.assessmentDetailModel
                .value!.namaAssessment!,
            style: textBold.copyWith(fontSize: 18),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Assets.icons.kelender.path,
                scale: 4,
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Mulai    : ${controller.fetchAPIProductDetailsController.assessmentDetailModel.value!.tanggalMulaiAssessment!} WIB'),
                  Text(
                      'Selesai  : ${controller.fetchAPIProductDetailsController.assessmentDetailModel.value!.tanggalBatasAssessment!} WIB'),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                Assets.icons.iconPenulis.path,
                scale: 4,
              ),
              const SizedBox(width: 10),
              Text(controller.fetchAPIProductDetailsController
                  .assessmentDetailModel.value!.penulis!)
            ],
          ),
        ],
      ),
    );
  }

  Widget cardBanner(String url) {
    print(url);
    return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: Get.width / 2.8,
            width: Get.width - 68,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
          );
        },
        placeholder: (context, url) {
          return Container(
            height: Get.width / 2.8,
            width: Get.width - 68,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(18)),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: Get.width / 2.8,
            width: Get.width - 68,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(18)),
          );
        });
  }
}
