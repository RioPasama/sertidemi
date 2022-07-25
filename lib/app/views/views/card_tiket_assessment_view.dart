import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/klik_content_controller.dart';
import 'package:sertidemi/app/data/models/assessment_tiket_model.dart';
import 'package:sertidemi/domain/core/extensions/formatTime.extension.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';

class CardTiketAssessmentView extends GetView {
  final AssessmentTiketModel assessmentTiketModel;
  const CardTiketAssessmentView({required this.assessmentTiketModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final KlikContentController klikContentController =
        Get.put(KlikContentController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () => klikContentController
            .onTapTiketAssessment(assessmentTiketModel.idTransaksi),
        child: Column(
          children: [
            _image(assessmentTiketModel.urlImagePanjang!),
            ClipPath(
                clipper: ClipPathTiketBottom(),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        assessmentTiketModel.nama!,
                        style: textBold.copyWith(
                            fontSize: 16, color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${timeFormatInCard(assessmentTiketModel.tanggalMulai!)} ${clockFormat(assessmentTiketModel.tanggalMulai!)}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Name : ${assessmentTiketModel.namaDaftar}',
                        style: const TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        assessmentTiketModel.deskripsi!,
                        style: const TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

Widget _image(String url) {
  return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) {
        return ClipPath(
            clipper: ClipPathTiketTop(),
            child: Container(
              height: 140,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.fill)),
            ));
      },
      placeholder: (context, url) {
        return ClipPath(
            clipper: ClipPathTiketTop(),
            child: Container(
              height: 140,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ));
      },
      errorWidget: (context, url, error) {
        return ClipPath(
            clipper: ClipPathTiketTop(),
            child: Container(
              height: 140,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ));
      });
}

class ClipPathTiketBottom extends CustomClipper<Path> {
  double radius = 15;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, radius);
    path.quadraticBezierTo(size.width - radius, radius, size.width - radius, 0);
    path.lineTo(radius, 0);
    path.quadraticBezierTo(radius, radius, 0, radius);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class ClipPathTiketTop extends CustomClipper<Path> {
  double radius = 15;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(radius, size.height - radius, radius, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(size.width - radius, size.height - radius,
        size.width, size.height - radius);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
