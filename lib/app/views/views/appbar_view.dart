import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';

AppBar appBarMultiScreenView({
  required String title,
  required List<Tab> tabs,
}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    bottom: TabBar(
      tabs: tabs,
      padding: const EdgeInsets.symmetric(horizontal: 16),
    ),
  );
}

AppBar appBarSearchCategory({
  required String title,
}) {
  return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      toolbarHeight: 140,
      elevation: 0.0,
      flexibleSpace: Stack(
        children: [
          Container(
            height: 130,
            width: Get.width,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(18)),
            ),
          ),
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16),
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  ))),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                )),
          )),
          Container(
            height: 40,
            width: Get.width,
            margin: const EdgeInsets.only(top: 110, left: 16, right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: shadowColor,
                      blurRadius: 4,
                      offset: const Offset(0, 4))
                ]),
          ),
        ],
      ));
}

AppBar appBarTransparentView({
  required String title,
}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: GestureDetector(
        onTap: () => Get.back(),
        child: const Icon(Icons.arrow_back_ios_new_rounded)),
  );
}

AppBar appBarDefaultView({
  required String title,
}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    leading: GestureDetector(
        onTap: () => Get.back(),
        child: const Icon(Icons.arrow_back_ios_new_rounded)),
  );
}
