import 'package:get/get.dart';
import 'package:sertidemi/domain/core/exceptions/error_api.Exception.exception.dart';

dynamic apiErrorHandler(Response? response, String? messageError) {
  switch (response?.statusCode) {
    case 500:
      errorServerErrorException(response: response!);
      throw 'Server Error pls retry later';
    case 400:
      errorInvalidRequestException(response: response!);
      throw 'Bad Request';
    case 403:
      errorInternetFailedException(response: response!);
      throw 'Error occurred pls check internet and retry.';
    default:
      errorNotDetectedException(response: response, message: messageError);
      throw 'Error occurred retry';
  }
}
