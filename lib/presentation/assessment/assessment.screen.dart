import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';

import 'controllers/assessment.controller.dart';

class AssessmentScreen extends GetView<AssessmentController> {
  @override
  final AssessmentController controller = Get.put(AssessmentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sertifikasi'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              height: 180,
              margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          Assets.images.vektorMenuSertifikasi.assetName))),
            ),
            ListTile(
              onTap: () =>
                  controller.klikContentController.onKlikCategory(option: 2),
              leading: Image.asset(
                Assets.icons.menuSertifikasiIconListEvent.assetName,
                scale: 4,
              ),
              title: const Text('Kategori Sertifikasi'),
            ),
            const Divider(),
            ListTile(
              onTap: () => Get.toNamed(Routes.LIST_TIKET, arguments: 2),
              leading: Image.asset(
                Assets.icons.menuSertifikasiIconTiket.assetName,
                scale: 4,
              ),
              title: const Text('Tiket'),
            ),
            const Divider(),
            ListTile(
              onTap: () => Get.toNamed(Routes.LIST_TRANSACTION, arguments: 2),
              leading: Image.asset(
                Assets.icons.menuSertifikasiIconTransaksi.assetName,
                scale: 4,
              ),
              title: const Text('Transaksi'),
            ),
            const Divider(),
            ListTile(
              onTap: () => Get.toNamed(Routes.LIST_CERTIFICATE, arguments: 2),
              leading: Image.asset(
                Assets.icons.menuSertifikasiIconSertifikat.assetName,
                scale: 4,
              ),
              title: const Text('Sertifikat'),
            ),
            const Divider(),
          ],
        ));
  }
}
