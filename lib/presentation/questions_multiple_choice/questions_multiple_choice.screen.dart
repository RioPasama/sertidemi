import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/questions_multiple_choice/views/countdown_timer_view.dart';

import 'controllers/questions_multiple_choice.controller.dart';

class QuestionsMultipleChoiceScreen
    extends GetView<QuestionsMultipleChoiceController> {
  @override
  final QuestionsMultipleChoiceController controller =
      Get.put(QuestionsMultipleChoiceController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(controller.getArguments['titleAppBar']),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            SafeArea(
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 16),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height - 240,
                            child: ListView(
                              children: [
                                CountdownTimerView(),
                                const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '${(controller.questionIndex.value + 1)}. ',
                                        style: textBold.copyWith(fontSize: 16)),
                                    SizedBox(
                                      width: Get.width - 80,
                                      child: Text(
                                        controller
                                            .questionsMultipleChoiceModel[
                                                controller.questionIndex.value]
                                            .soalText!,
                                        style: textBold.copyWith(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                multipeChoice(
                                    value: 1,
                                    groupValue: controller.groupValue.value,
                                    choiceText: controller
                                        .questionsMultipleChoiceModel[
                                            controller.questionIndex.value]
                                        .pilihanAText!,
                                    choiceImage: controller
                                        .questionsMultipleChoiceModel[
                                            controller.questionIndex.value]
                                        .pilihanAGambar!),
                                const SizedBox(height: 20),
                                multipeChoice(
                                    value: 2,
                                    groupValue: controller.groupValue.value,
                                    choiceText: controller
                                        .questionsMultipleChoiceModel[
                                            controller.questionIndex.value]
                                        .pilihanBText!,
                                    choiceImage: controller
                                        .questionsMultipleChoiceModel[
                                            controller.questionIndex.value]
                                        .pilihanBGambar!),
                                const SizedBox(height: 20),
                                multipeChoice(
                                    value: 3,
                                    groupValue: controller.groupValue.value,
                                    choiceText: controller
                                        .questionsMultipleChoiceModel[
                                            controller.questionIndex.value]
                                        .pilihanCText!,
                                    choiceImage: controller
                                        .questionsMultipleChoiceModel[
                                            controller.questionIndex.value]
                                        .pilihanCGambar!),
                                const SizedBox(height: 20),
                                multipeChoice(
                                    value: 4,
                                    groupValue: controller.groupValue.value,
                                    choiceText: controller
                                        .questionsMultipleChoiceModel[
                                            controller.questionIndex.value]
                                        .pilihanDText!,
                                    choiceImage: controller
                                        .questionsMultipleChoiceModel[
                                            controller.questionIndex.value]
                                        .pilihanDGambar!),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: 48,
                              child: Center(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: controller
                                      .questionsMultipleChoiceModel.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () =>
                                          controller.onTapPageQuestions(index),
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 8),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: Colors.grey),
                                            color: (controller
                                                        .questionIndex.value ==
                                                    index)
                                                ? primaryColor
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 4,
                                                  offset: Offset(2, 2))
                                            ]),
                                        child: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                              color: (controller.questionIndex
                                                          .value ==
                                                      index)
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )),
                        ],
                      ),
                    ))),
            Obx(() => Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Visibility(
                        visible: controller.questionIndex.value != 0,
                        child: GestureDetector(
                          onTap: () => controller.onTapBackQuestion(),
                          child: Container(
                            width: 150,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(28))),
                            child: Text(
                              'Previous',
                              style: textBold.copyWith(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 10),
                      Visibility(
                        visible: (controller.questionIndex.value !=
                            controller.questionsMultipleChoiceModel.length - 1),
                        child: GestureDetector(
                          onTap: () => controller.onTapNextQuestion(),
                          child: Container(
                            width: 150,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(28))),
                            child: Text(
                              'Next',
                              style: textBold.copyWith(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: (controller.questionIndex.value ==
                            controller.questionsMultipleChoiceModel.length - 1),
                        child: GestureDetector(
                          onTap: () => controller.onTapFinish(),
                          child: Container(
                            width: 150,
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(28))),
                            child: Text(
                              'Done',
                              style: textBold.copyWith(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget multipeChoice(
      {required int value,
      required int groupValue,
      required String choiceText,
      required String choiceImage}) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: groupValue,
            onChanged: (value) => controller.onTapMultipleChoice(value: value)),
        Visibility(
          visible: (choiceImage != ''),
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(color: Colors.amber),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: Get.width - 220,
          child: Text(choiceText),
        )
      ],
    );
  }
}
