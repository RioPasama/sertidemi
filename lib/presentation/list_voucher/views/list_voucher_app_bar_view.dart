import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/widget_decoration.theme.dart';
import 'package:sertidemi/presentation/list_voucher/controllers/list_voucher.controller.dart';

class ListVoucherAppBarView extends GetView {
  ListVoucherAppBarView({Key? key}) : super(key: key);
  @override
  final ListVoucherController controller = Get.put(ListVoucherController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Container(
          height: 90,
          width: Get.width,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(18))),
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
              const Text(
                'Voucher',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(width: 48)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: Get.width - (16 * 2) - 50,
                decoration: inputBoxDecorationRounded.copyWith(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 4,
                          offset: Offset(0, 2))
                    ]),
                child: TextField(
                  controller: controller.search,
                  decoration: inputInputDecorationRounded.copyWith(
                      hintText: 'Search',
                      hintStyle: const TextStyle(fontSize: 14),
                      prefixIcon: const Icon(Icons.search_outlined),
                      suffixIcon: Obx(
                        () => controller.isSearch.value
                            ? GestureDetector(
                                onTap: () => controller.onResetSearc(),
                                child: const Icon(Icons.close))
                            : const SizedBox(),
                      )),
                  onSubmitted: (value) {
                    controller.onTapSearch(value);
                  },
                ),
              ),
              GestureDetector(
                onTap: () => controller.onTapFilter(),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: inputBoxDecorationRounded.copyWith(
                      image: DecorationImage(
                          image: AssetImage(Assets.icons.iconFilter.path),
                          scale: 6),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 4,
                            offset: Offset(0, 2))
                      ]),
                ),
              )
            ],
          ),
        ),
        //Code Voucher
        // Padding(
        //   padding: const EdgeInsets.only(top: 120, left: 16, right: 16),
        //   child: Container(
        //     height: 34,
        //     padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        //     decoration: BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.circular(10.0),
        //         border: Border.all(width: 1, color: Colors.grey),
        //         boxShadow: const [
        //           BoxShadow(
        //               color: Colors.black54,
        //               blurRadius: 4,
        //               offset: Offset(0, 2))
        //         ]),
        //     child: Row(
        //       children: [
        //         Image.asset(Assets.icons.iconVoucher.path),
        //         const SizedBox(width: 10),
        //         Text(
        //           'Enter Code Voucher',
        //           style: textBold,
        //         ),
        //         const Spacer(),
        //         const Icon(Icons.arrow_forward_ios_rounded)
        //       ],
        //     ),
        //   ),
        // )
      ],
    ));
  }
}
