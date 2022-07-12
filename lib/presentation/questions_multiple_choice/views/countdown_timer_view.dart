import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/questions_multiple_choice/controllers/questions_multiple_choice.controller.dart';
import 'package:slide_countdown/slide_countdown.dart';

class CountdownTimerView extends GetView {
  CountdownTimerView({Key? key}) : super(key: key);
  @override
  final QuestionsMultipleChoiceController controller =
      Get.put(QuestionsMultipleChoiceController());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          Assets.icons.transaksiJam.assetName,
          scale: 3,
        ),
        SlideCountdownSeparated(
          duration: Duration(
              seconds: int.parse(controller.getArguments['waktuPengerjaan'])),
          decoration: const BoxDecoration(color: Colors.transparent),
          textStyle: textBold,
          onDone: () => controller.finish(),
          onChanged: (value) {
            controller.timeDuration.value -= 1;
            print(controller.timeDuration.value.toString());
          },
        )
      ],
    );
  }
}
