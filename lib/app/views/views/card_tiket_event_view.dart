import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/klik_content_controller.dart';
import 'package:sertidemi/app/data/models/event_tiket_model.dart';
import 'package:sertidemi/domain/core/extensions/formatTime.extension.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';

class CardTiketEventView extends GetView {
  final EventTiketModel eventTiketModel;
  const CardTiketEventView({required this.eventTiketModel, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final KlikContentController klikContentController =
        Get.put(KlikContentController());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
          onTap: () =>
              klikContentController.onTapTiketEvent(eventTiketModel.idevent),
          child: Column(
            children: [
              _image(eventTiketModel.urlImagePanjang!),
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                eventTiketModel.namaEvent!,
                                style: textBold.copyWith(
                                    fontSize: 16, color: Colors.white),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '${timeFormatInCard(eventTiketModel.eventMulai!)} ${clockFormat(eventTiketModel.eventMulai!)} WIB',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                eventTiketModel.deskripsi!,
                                style: const TextStyle(color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                          //Assesmet
                          Visibility(
                            visible: eventTiketModel.idassessment != '',
                            child: GestureDetector(
                              onTap: () => klikContentController
                                  .onTapTiketEventToAssesment(
                                      idProduct: eventTiketModel.idassessment!),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Assets
                                          .icons.iconAssesmentDiTiketEvent.path,
                                      scale: 4,
                                    ),
                                    const Text(
                                      'Assesmet',
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Buton link
                          GestureDetector(
                            onTap: () =>
                                klikContentController.onTapTiketEventLink(
                                    eventTiketModel.linkMeeting!),
                            child: Container(
                              height: 30,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade400,
                                  borderRadius: BorderRadius.circular(14)),
                              child: Text(
                                eventTiketModel.linkStatus!,
                                style: textBold.copyWith(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          //Buton Materi
                          Visibility(
                            visible: eventTiketModel.materiCount != '0',
                            child: GestureDetector(
                              onTap: () =>
                                  klikContentController.onTapTiketEventMateri(
                                      eventTiketModel.idevent!),
                              child: Container(
                                height: 30,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade400,
                                    borderRadius: BorderRadius.circular(14)),
                                child: Text(
                                  'Materi',
                                  style: textBold.copyWith(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
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
