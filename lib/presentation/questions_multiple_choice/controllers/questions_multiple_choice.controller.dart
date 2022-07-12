import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/asessment_answer_model.dart';
import 'package:sertidemi/app/data/models/questions_multiple_choice_model.dart';
import 'package:sertidemi/app/data/providers/asessment_answer_provider.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';

class QuestionsMultipleChoiceController extends GetxController {
  late RxList<QuestionsMultipleChoiceModel> questionsMultipleChoiceModel =
      RxList<QuestionsMultipleChoiceModel>();
  late Rxn<AsessmentAnswerModel> asessmentAnswerModel =
      Rxn<AsessmentAnswerModel>();

  Map<String, dynamic> getArguments = Get.arguments;
  List<Map<String, dynamic>> saveQuestions = [];

  RxInt groupValue = 0.obs;
  RxInt questionIndex = 0.obs;
  RxInt totalPageQuestion = 0.obs;
  RxInt timeDuration = 0.obs;

  @override
  void onInit() {
    timeDuration.value = int.parse(getArguments['waktuPengerjaan']);
    questionsMultipleChoiceModel = getArguments['questionsMultipleChoiceModel'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  void onTapFinish() async {
    if (saveQuestions.length != questionsMultipleChoiceModel.length) {
      Get.dialog(AlertDialog(
        title: const Text('Selesai'),
        content: const Text(
            'Anda belum menyelesaikan seluruh soal silakan cek kembali'),
        actions: [
          TextButton(
              onPressed: () async {
                Get.back();
                finish();
              },
              child: const Text(
                'Selesai',
                style: TextStyle(color: Colors.grey),
              )),
          TextButton(
              onPressed: () => Get.back(), child: const Text('Cek Kembali'))
        ],
      ));
      return;
    }
    finish();
  }

  void finish() async {
    int duration =
        int.parse(getArguments['waktuPengerjaan']) - timeDuration.value;
    String durationFormat = format(Duration(seconds: duration));
    asessmentAnswerModel.value =
        await AsessmentAnswerProvider.postAsessmentAnswer(
            idAssessment: getArguments['idAssessment'],
            idTransaksi: (getArguments['idTransaksi']),
            duration: durationFormat,
            saveAnswer: saveQuestions);

    if (asessmentAnswerModel.value!.idAssessment != '') {
      Get.offNamed(Routes.FINISH_ASSESSMENT, arguments: asessmentAnswerModel);
    }
  }

  void onTapMultipleChoice({required dynamic value}) {
    late String answer;
    groupValue.value = value;

    switch (value) {
      case 1:
        answer = 'A';
        break;
      case 2:
        answer = 'B';
        break;
      case 3:
        answer = 'C';
        break;
      case 4:
        answer = 'D';
        break;
      case 5:
        answer = 'E';
        break;
      case 6:
        answer = 'F';
        break;
      default:
    }

    for (int i = 0; i < saveQuestions.length; i++) {
      if (saveQuestions[i].containsValue(
        questionsMultipleChoiceModel[questionIndex.value]
            .idassessmentSoalPilgan,
      )) {
        saveQuestions.removeAt(i);
      }
    }

    saveQuestions.add({
      'idsoal': questionsMultipleChoiceModel[questionIndex.value]
          .idassessmentSoalPilgan,
      'answer': answer,
    });

    log(saveQuestions.toString());
  }

  void onTapPageQuestions(int pageIndex) {
    questionIndex.value = pageIndex;
    saveAndClearGroupValue();
  }

  void onTapNextQuestion() {
    questionIndex.value += 1;
    saveAndClearGroupValue();
  }

  void onTapBackQuestion() {
    questionIndex.value -= 1;
    saveAndClearGroupValue();
  }

  void saveAndClearGroupValue() {
    for (int i = 0; i < saveQuestions.length; i++) {
      if (saveQuestions[i].containsValue(
        questionsMultipleChoiceModel[questionIndex.value]
            .idassessmentSoalPilgan,
      )) {
        switch (saveQuestions[i]['answer']) {
          case 'A':
            groupValue.value = 1;
            break;
          case 'B':
            groupValue.value = 2;
            break;
          case 'C':
            groupValue.value = 3;
            break;
          case 'D':
            groupValue.value = 4;
            break;
          case 'E':
            groupValue.value = 5;
            break;
          case 'F':
            groupValue.value = 6;
            break;
          default:
        }

        return;
      }
      groupValue.value = 0;
    }
  }
}
