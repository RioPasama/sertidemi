import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/widget_decoration.theme.dart';

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

AppBar appBarSearch({
  required String title,
  bool leadingActive = true,
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
          Visibility(
            visible: leadingActive,
            child: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ))),
          ),
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
            child: TextField(
              decoration: inputInputDecorationRounded.copyWith(
                hintText: 'Pencarian',
                hintStyle: const TextStyle(fontSize: 14),
                prefixIcon: const Icon(Icons.search_outlined),
              ),
            ),
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

AppBar appBarHomeView() {
  return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Container(
              height: 40,
              width: Get.width - 68,
              decoration: inputBoxDecorationRounded,
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.HOME_SEARCH),
                child: TextField(
                  enabled: false,
                  decoration: inputInputDecorationRounded.copyWith(
                    hintText: 'Pencarian',
                    hintStyle: const TextStyle(fontSize: 14),
                    prefixIcon: const Icon(Icons.search_outlined),
                  ),
                ),
              )),
          // const Spacer(flex: 2),
          // Image.asset(
          //   Assets.icons.iconKeranjang.assetName,
          //   scale: 6,
          // ),
          const Spacer(),
          // GestureDetector(
          //   onTap: () => Get.toNamed(Routes.NOTIFICATION),
          //   child: Image.asset(
          //     Assets.icons.iconNotifikasi.path,
          //     scale: 6,
          //   ),
          // ),
        ],
      ),
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.zero)));
}
