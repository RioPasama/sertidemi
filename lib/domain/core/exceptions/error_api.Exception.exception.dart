import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

///errorNotDetectedException [response] is result response by `MainProvider`
///and [message] resault for try catch
errorNotDetectedException({http.Response? response, String? message}) {
  dynamic result;
  log(response!.body.toString());
  if (response.body.isNotEmpty) {
    result = jsonDecode(response.body);
  }
  return Get.dialog(AlertDialog(
    title: Center(child: Text('Error ${response.statusCode}')),
    content: Text(
        'Terjadi kesalahan coba lagi\n$message\n${result?['message'] ?? ''}'),
  ));
}

///errorInvalidRequestException [response] is result response by `MainProvider`
errorInvalidRequestException({http.Response? response}) {
  final result = jsonDecode(response!.body);

  return Get.dialog(AlertDialog(
    title: const Center(child: Text('Error')),
    content: Text('Bad Request ${response.statusCode}\n${result['message']}'),
  ));
}

///errorInternetFailedException [response] is result response by `MainProvider`
errorInternetFailedException({http.Response? response}) {
  final result = jsonDecode(response!.body);

  return Get.dialog(AlertDialog(
    title: const Center(child: Text('Error')),
    content: Text(
        'Terjadi kesalahan, harap periksa internet dan coba lagi ${response.statusCode}\n${result['message']}'),
  ));
}

///errorNotFountException [response] is result response by `MainProvider`
errorNotFountException({http.Response? response}) {
  return Get.dialog(AlertDialog(
    title: const Center(child: Text('Error')),
    content: Text(
      'Not Found ${response!.statusCode}\n${response.body}',
      maxLines: 6,
    ),
  ));
}

///errorServerErrorException [response] is result response by `MainProvider`
///and [message] resault for try catch
errorServerErrorException({http.Response? response, String? message}) {
  dynamic result;
  log(response!.body.toString());
  if (response.body.isNotEmpty) {
    result = jsonDecode(response.body);
  }
  return Get.dialog(AlertDialog(
    title: const Center(child: Text('Error')),
    content: Text(
        'Kesalahan Server, harap coba lagi nanti ${response.statusCode}\n${result?['message'] ?? ''}$message'),
  ));
}
