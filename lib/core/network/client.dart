import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../exceptions/server_exception.dart';
import '../utils/utils.dart';
import 'app_header.dart';
import 'http.dart';

@injectable
class AppClient {
  AppHeader header = AppHeader();

  set setHeader(AppHeader header) {
    this.header = header;
  }

  Future<Response<dynamic>> get(String url, {
    Map<String, dynamic>? queryParams,
  }) async {
    _checkConnection();
    final response = await dio.get(
      url,
      queryParameters: queryParams,
      options: Options(
        headers: header.toJson(),
      ),
    );
    return HttpUtil.handleResponse(response);
  }

  Future<Response<dynamic>> post(String url, {
    dynamic body,
    String? contentType,
  }) async {
    final response = await dio.post(
      url,
      data: body,
      options: Options(
        headers: header.toJson(),
        contentType: contentType ?? 'application/json; charset=utf-8',
      ),
    );
    return HttpUtil.handleResponse(response);
  }

  Future<Response<dynamic>> put(String url, {dynamic body}) async {
    final response = await dio.put(
      url,
      data: body,
      options: Options(
        headers: header.toJson(),
      ),
    );
    return HttpUtil.handleResponse(response);
  }

  Future<Response<dynamic>> delete(String url,
      {Map<String, dynamic>? queryParams}) async {
    final response = await dio.delete(
      url,
      queryParameters: queryParams,
      options: Options(
        headers: header.toJson(),
      ),
    );
    return HttpUtil.handleResponse(response);
  }

  Future<dynamic> getResponseFromApi({required String? api}) async {
    try {
      final Response response = await Dio().get(api!);
      return json.decode(response.data);
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> _checkConnection() async {
    // bool isNetworkConnected = await networkInfoImpl.isConnected;
    // if (!isNetworkConnected) {
    //   throw AppException(
    //     err: BaseErrorResModel(
    //       statusCode: -1,
    //       statusMessage: 'Please check the network connection again!',
    //     ),
    //   );
    // }
  }
}
