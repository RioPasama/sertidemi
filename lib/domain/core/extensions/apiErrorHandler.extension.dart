import 'package:sertidemi/domain/core/exceptions/error_api.Exception.exception.dart';

import 'package:http/http.dart' as http;

///apiErrorHandler  works if an error occurs on the APIs request
///* [response] is result response by `MainProvider`
///* [messageError] resault for try catch
dynamic apiErrorHandler(http.Response? response, String? messageError) {
  switch (response?.statusCode) {
    case 500:
      errorServerErrorException(response: response, message: messageError);
      throw 'Server Error pls retry later';
    case 400:
      errorInvalidRequestException(response: response!);
      throw 'Bad Request';
    case 403:
      errorInternetFailedException(response: response!);
      throw 'Error occurred pls check internet and retry.';
    case 404:
      errorNotFountException(response: response!);
      throw 'Error not found.';
    default:
      errorNotDetectedException(response: response, message: messageError);
      throw 'Error occurred retry';
  }
}
