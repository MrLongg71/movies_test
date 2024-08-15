import 'package:dio/dio.dart';
import 'package:movies_test/core/models/base_error_res_model.dart';

import '../exceptions/server_exception.dart';

class HttpUtil {
  static dynamic handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      // case 201:
      //   return response;
      // case 302:
      //   return response;
      default:
        BaseErrorResModel errorResModel = BaseErrorResModel.fromJson(
          response.data,
        );
        throw ServerException(
          err: errorResModel,
        );
    }
  }
}
