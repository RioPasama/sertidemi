import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/presentation/screens.dart';

class EventView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
          decoration: const BoxDecoration(color: Colors.grey),
        ),
        ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              onTap: () =>
                  Get.to(() => CategoryCertificationsScreen(), arguments: 1),
              leading: iconColorBackground(
                  icon: Icons.event_rounded, color: Colors.green),
              title: const Text('List Event'),
            ),
            const Divider(),
            ListTile(
              leading: iconColorBackground(
                  icon: Icons.event_rounded, color: Colors.redAccent),
              title: const Text('Tiket'),
            ),
            const Divider(),
            ListTile(
              leading: iconColorBackground(
                  icon: Icons.event_rounded, color: Colors.yellowAccent),
              title: const Text('Transaksi'),
            ),
            const Divider(),
            ListTile(
              leading: iconColorBackground(
                  icon: Icons.event_rounded, color: Colors.deepPurple),
              title: const Text('Sertifikat'),
            ),
            const Divider()
          ],
        ),
      ],
    );
  }

  Container iconColorBackground({
    required IconData icon,
    required Color color,
  }) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
