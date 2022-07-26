import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/authentication_controller.dart';
import 'package:sertidemi/app/controllers/customer_services_controller.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';

import 'controllers/profile.controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  @override
  final ProfileController controller = Get.put(ProfileController());
  final AuthenticationController authenticationControllercontroller =
      Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    authenticationControllercontroller.authProfile();
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Profile'),
          elevation: 0,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Get.height / 1.4,
                width: Get.width,
                padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50))),
                child: Column(
                  children: [
                    Obx(
                      () => Text(
                        authenticationControllercontroller.nameUser.value,
                        style: textBold.copyWith(fontSize: 18),
                      ),
                    ),
                    Obx(
                      () => Text(
                          authenticationControllercontroller.emailUser.value),
                    ),
                    Text(
                        authenticationControllercontroller
                            .kodeReferalUser.value,
                        style: textBold),
                    const SizedBox(height: 16),
                    const Divider(thickness: 2),
                    SizedBox(
                      height: Get.height / 2 - 18,
                      child: ListView(
                        children: [
                          ListTile(
                            leading: Image.asset(
                              Assets.icons.profilIconUbahData.path,
                              scale: 4,
                            ),
                            title: const Text('Edit Profile'),
                            onTap: () => Get.toNamed(Routes.CHANGE_PROFILE),
                          ),
                          ListTile(
                            onTap: () => Get.toNamed(Routes.MY_VOUCHER),
                            leading: Image.asset(
                              Assets.icons.iconVoucher.path,
                              scale: 4,
                            ),
                            title: const Text('My Voucher'),
                          ),
                          // ListTile(
                          //   onTap: () => Get.toNamed(Routes.BOOKSHELF),
                          //   leading: Image.asset(
                          //     Assets.icons.profilIconRakBuku.path,
                          //     scale: 4,
                          //   ),
                          //   title: const Text('Rak Buku'),
                          // ),
                          // ListTile(
                          //   leading: Image.asset(
                          //     Assets.icons.profilIconTransaksiEBook.path,
                          //     scale: 4,
                          //   ),
                          //   title: const Text('Transaksi E-Book'),
                          // ),
                          ListTile(
                            onTap: () => CustomerServicesController()
                                .onTapCustomerServices(),
                            leading: Image.asset(
                              Assets.icons.profilIconPelayananPelanggan.path,
                              scale: 4,
                            ),
                            title: const Text('Customer Service'),
                          ),
                          ListTile(
                            onTap: () => controller.onTapPrivacyPolicy(),
                            leading: Image.asset(
                              Assets.icons.profilIconLisensi.path,
                              scale: 4,
                            ),
                            title: const Text('Privacy Policy'),
                          ),
                          ListTile(
                            onTap: () => controller.onTapAbout(),
                            leading: Image.asset(
                              Assets.icons.profilIconTentang.path,
                              scale: 4,
                            ),
                            title: const Text('About'),
                          ),
                          const SizedBox(height: 16),
                          const Divider(thickness: 2),
                          const SizedBox(height: 16),
                          TextButton(
                              onPressed: () =>
                                  authenticationControllercontroller.logOut(),
                              child: Text('Logout',
                                  style: textBold.copyWith(color: Colors.red)))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Obx(
                  () => imageProfile(
                      authenticationControllercontroller.urlImageUser.value),
                )),
          ],
        ));
  }

  Widget imageProfile(String url) {
    return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: Get.height / 6,
            width: Get.height / 6,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 6),
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          );
        },
        placeholder: (context, url) {
          return Container(
            height: Get.height / 6,
            width: Get.height / 6,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 6),
                image: DecorationImage(
                    image: AssetImage(Assets.images.imgDefaul.path))),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: Get.height / 6,
            width: Get.height / 6,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 6),
                image: DecorationImage(
                    image: AssetImage(Assets.images.imgDefaul.path))),
          );
        });
  }
}
