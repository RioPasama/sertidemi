import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/authentication_controller.dart';
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
          title: const Text('Profil'),
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
                    Text(
                      authenticationControllercontroller.nameUser.value,
                      style: textBold.copyWith(fontSize: 18),
                    ),
                    Text(authenticationControllercontroller.emailUser.value),
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
                              Assets.icons.profilIconUbahData.assetName,
                              scale: 4,
                            ),
                            title: const Text('Ubah Data'),
                          ),
                          // ListTile(
                          //   onTap: () => Get.toNamed(Routes.BOOKSHELF),
                          //   leading: Image.asset(
                          //     Assets.icons.iconVoucher.assetName,
                          //     scale: 4,
                          //   ),
                          //   title: const Text('Voucher'),
                          // ),
                          // ListTile(
                          //   onTap: () => Get.toNamed(Routes.BOOKSHELF),
                          //   leading: Image.asset(
                          //     Assets.icons.profilIconRakBuku.assetName,
                          //     scale: 4,
                          //   ),
                          //   title: const Text('Rak Buku'),
                          // ),
                          // ListTile(
                          //   leading: Image.asset(
                          //     Assets.icons.profilIconTransaksiEBook.assetName,
                          //     scale: 4,
                          //   ),
                          //   title: const Text('Transaksi E-Book'),
                          // ),
                          ListTile(
                            leading: Image.asset(
                              Assets
                                  .icons.profilIconPelayananPelanggan.assetName,
                              scale: 4,
                            ),
                            title: const Text('PelayananPelanggan'),
                          ),
                          ListTile(
                            leading: Image.asset(
                              Assets.icons.profilIconLisensi.assetName,
                              scale: 4,
                            ),
                            title: const Text('Lisensi'),
                          ),
                          ListTile(
                            leading: Image.asset(
                              Assets.icons.profilIconTentang.assetName,
                              scale: 4,
                            ),
                            title: const Text('Tentang'),
                          ),
                          const SizedBox(height: 16),
                          const Divider(thickness: 2),
                          const SizedBox(height: 16),
                          TextButton(
                              onPressed: () =>
                                  authenticationControllercontroller.logOut(),
                              child: Text('Keluar',
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
                child: imageProfile(
                    authenticationControllercontroller.urlImageUser.value)),
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
                image: DecorationImage(image: imageProvider)),
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
                    image: AssetImage(Assets.images.imgDefaul.assetName))),
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
                    image: AssetImage(Assets.images.imgDefaul.assetName))),
          );
        });
  }
}
