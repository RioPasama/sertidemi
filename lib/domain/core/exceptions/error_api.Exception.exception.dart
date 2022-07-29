import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

///errorNotDetectedException [response] is result response by `MainProvider`
///and [message] resault for try catch
errorNotDetectedException({http.Response? response, String? message}) {
  dynamic result;
  // log(response?.body.toString() ?? '');
  // if (response!.body.isNotEmpty) {
  //   result = jsonDecode(response.body);
  // }
  return Get.dialog(AlertDialog(
    title: Center(child: Text('Error ${response?.statusCode}')),
    content:
        Text('Check your connection\n$message\n${result?['message'] ?? ''}'),
  ));
}

///errorInvalidRequestException [response] is result response by `MainProvider`
errorInvalidRequestException({http.Response? response}) {
  final result = jsonDecode(response!.body);

  return Get.dialog(AlertDialog(
    title: const Center(child: Text('Error')),
    content: Text('${result['message']}'),
    actions: [Text('Bad Request ${response.statusCode}')],
  ));
}

///errorInternetFailedException [response] is result response by `MainProvider`
errorInternetFailedException({http.Response? response}) {
  final result = jsonDecode(response!.body);

  return Get.dialog(AlertDialog(
    title: const Center(child: Text('Error')),
    content: Text('${result['message']}'),
    actions: [
      Text('please check the internet and try again ${response.statusCode}')
    ],
  ));
}

///errorNotFountException [response] is result response by `MainProvider`
errorNotFountException({http.Response? response}) {
  return Get.dialog(AlertDialog(
    title: const Center(child: Text('Error')),
    content: Text(
      response!.body,
      maxLines: 6,
    ),
    actions: [Text('Not Found ${response.statusCode}')],
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
    content: Text('${result?['message'] ?? ''}$message'),
    actions: [
      Text('Server Error, please try again later${response.statusCode}')
    ],
  ));
}
