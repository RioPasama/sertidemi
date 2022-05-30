import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/presentation/screens.dart';
import 'controllers/main.controller.dart';

class MainScreen extends GetView<MainController> {
  @override
  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(controller.selectedIndex.value),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Rak Buku',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Sertifikasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          showUnselectedLabels: true,
          unselectedItemColor: unselectedWidgetColor,
          selectedItemColor: primaryColor,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onItemTapped,
        ),
      );
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    BookshelfScreen(),
    CertificationScreen(),
    ProfileScreen()
  ];
}
