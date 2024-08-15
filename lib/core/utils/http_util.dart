import 'package:dio/dio.dart';
import 'package:movies_test/core/models/base_error_res_model.dart';
import 'package:movies_test/core/utils/logger_util.dart';

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
        LOG.e('\n ERROR: ${response.data}');
        BaseErrorResModel? errorResModel = BaseErrorResModel.fromJson(
          response.data,
        );
        throw ServerException(
          err: errorResModel,
        );
    }
  }
}
