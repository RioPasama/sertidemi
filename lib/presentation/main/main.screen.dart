import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/gen/assets.gen.dart';
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
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.icons.menuHome.assetName,
                scale: 6,
              ),
              activeIcon: Image.asset(
                Assets.icons.menuHomeKlik.assetName,
                scale: 6,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.icons.menuEvent.assetName,
                scale: 6,
              ),
              activeIcon: Image.asset(
                Assets.icons.menuEventKlik.assetName,
                scale: 6,
              ),
              label: 'Event',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.icons.menuSertifikasi.assetName,
                scale: 6,
              ),
              activeIcon: Image.asset(
                Assets.icons.menuSertifikasiKlik.assetName,
                scale: 6,
              ),
              label: 'Sertifikasi',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.icons.menuProfil.assetName,
                scale: 6,
              ),
              activeIcon: Image.asset(
                Assets.icons.menuProfilKlik.assetName,
                scale: 6,
              ),
              label: 'Profil',
            ),
          ],
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          enableFeedback: false,
          unselectedItemColor: unselectedWidgetColor,
          selectedItemColor: primaryColor,
          backgroundColor: Colors.white,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onItemTapped,
        ),
      );
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    EventScreen(),
    AssessmentScreen(),
    ProfileScreen()
  ];
}
