import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/list_event_certificate_model.dart';
import 'package:sertidemi/domain/core/extensions/formatTime.extension.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';

class ListEventCertificateView extends GetView {
  final List<ListEventCertificateModel> listCertificateModel;
  const ListEventCertificateView({required this.listCertificateModel, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listCertificateModel.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return cardCertificate(listCertificateModel[index]);
      },
    );
  }

  Widget cardCertificate(ListEventCertificateModel data) {
    return GestureDetector(
      onTap: () =>
          Get.toNamed(Routes.CERTIFICATE, arguments: data.linkSertifikat),
      child: Container(
        height: Get.width / 2.8,
        width: Get.width - 68,
        margin: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
                image: NetworkImage(data.urlSertifikatDepanTemplate!),
                fit: BoxFit.fill)),
        child: Container(
          height: Get.width / 2.8,
          width: Get.width - 68,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.transparent,
                ],
                begin: const FractionalOffset(0.0, 1.0),
                end: const FractionalOffset(0.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  width: Get.width / 1.8,
                  child: Text(
                    data.namaAssessment!,
                    maxLines: 1,
                    style: textBold.copyWith(color: Colors.white),
                  )),
              Text(
                '${timeFormatInCard(data.tglInputTime!)}, ${clockFormat(data.tglInputTime!)}',
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
