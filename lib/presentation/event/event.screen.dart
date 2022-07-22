import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';

import 'controllers/event.controller.dart';

class EventScreen extends GetView<EventController> {
  @override
  final EventController controller = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Event'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              height: 180,
              margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.images.vektorMenuEvent.path))),
            ),
            ListTile(
              onTap: () =>
                  controller.klikContentController.onKlikCategory(option: 1),
              leading: Image.asset(
                Assets.icons.menuSertifikasiIconListEvent.path,
                scale: 4,
              ),
              title: const Text('Event Category'),
            ),
            const Divider(),
            ListTile(
              onTap: () => Get.toNamed(Routes.LIST_TIKET, arguments: 1),
              leading: Image.asset(
                Assets.icons.menuSertifikasiIconTiket.path,
                scale: 4,
              ),
              title: const Text('Ticket'),
            ),
            const Divider(),
            ListTile(
              onTap: () => Get.toNamed(Routes.LIST_TRANSACTION, arguments: 1),
              leading: Image.asset(
                Assets.icons.menuSertifikasiIconTransaksi.path,
                scale: 4,
              ),
              title: const Text('Transaction'),
            ),
            const Divider(),
            ListTile(
              onTap: () => Get.toNamed(Routes.LIST_CERTIFICATE, arguments: 1),
              leading: Image.asset(
                Assets.icons.menuSertifikasiIconSertifikat.path,
                scale: 4,
              ),
              title: const Text('Certificate'),
            ),
            const Divider(),
          ],
        ));
  }
}
