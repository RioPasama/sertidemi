import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorNotDetectedException({Response? response, String? message}) {
  dynamic result;
  if (response?.body != null) {
    result = jsonDecode(response?.body);
  }
  return Get.dialog(AlertDialog(
    title: Text('Error ${response?.statusCode ?? ''}'),
    content: Text(
        'Terjadi kesalahan coba lagi\n$message\n${result?['pesan'] ?? ''}'),
  ));
}

errorInvalidRequestException({required Response response}) {
  final result = jsonDecode(response.body);

  return Get.dialog(AlertDialog(
    title: const Text('Error'),
    content: Text('Bad Request ${response.statusCode}\n${result['pesan']}'),
  ));
}

errorInternetFailedException({required Response response}) {
  final result = jsonDecode(response.body);

  return Get.dialog(AlertDialog(
    title: const Text('Error'),
    content: Text(
        'Terjadi kesalahan, harap periksa internet dan coba lagi ${response.statusCode}\n${result['pesan']}'),
  ));
}

errorServerErrorException({required Response response}) {
  final result = jsonDecode(response.body);

  return Get.dialog(AlertDialog(
    title: const Text('Error'),
    content: Text(
        'Kesalahan Server, harap coba lagi nanti ${response.statusCode}\n${result['pesan']}'),
  ));
}
