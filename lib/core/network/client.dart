import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_test/core/network/config_network.dart';

import '../exceptions/server_exception.dart';
import '../utils/logger_util.dart';
import '../utils/utils.dart';
import 'app_header.dart';
import 'http.dart';

@singleton
class AppClient {
  AppHeader header = AppHeader();

  set setHeader(AppHeader header) {
    this.header = header;
  }

  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParams,
  }) async {
    String log =
        "[GET]\n url: ${ConfigNetwork.apiUrl}$url \n queryParams: $queryParams\n headers: ${header.toJson()}";
    try {
      LOG.i(log);
      final response = await dio.get(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: header.toJson(),
        ),
      );
      LOG.i('[GET] $url Response: ${response.data}');
      return HttpUtil.handleResponse(response);
    } catch (e) {
      LOG.e(log);
      throw _handleErrorRes(e, url);
    }
  }

  Future<Response<dynamic>> post(
    String url, {
    dynamic body,
    String? contentType,
  }) async {
    String log =
        "[POST]\n url: ${ConfigNetwork.apiUrl}$url \n body: $body\n headers: ${header.toJson()}";
    try {
      LOG.i(log);
      final response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: header.toJson(),
          contentType: contentType ?? 'application/json; charset=utf-8',
        ),
      );
      LOG.i('[POST] $url Response: ${response.data}');
      return HttpUtil.handleResponse(response);
    } catch (e) {
      LOG.e(log);
      throw _handleErrorRes(e, url);
    }
  }

  Future<Response<dynamic>> put(String url, {dynamic body}) async {
    String log =
        "[PUT]\n url: ${ConfigNetwork.apiUrl}$url \n body: $body\n headers: ${header.toJson()}";
    try {
      LOG.i(log);
      final response = await dio.put(
        url,
        data: body,
        options: Options(
          headers: header.toJson(),
        ),
      );
      LOG.i('[PUT] $url Response: ${response.data}');
      return HttpUtil.handleResponse(response);
    } catch (e) {
      LOG.e(log);
      throw _handleErrorRes(e, url);
    }
  }

  Future<Response<dynamic>> delete(
    String url, {
    Map<String, dynamic>? queryParams,
  }) async {
    String log =
        "[DELETE]\n url: ${ConfigNetwork.apiUrl}$url \n queryParams: $queryParams \n headers: ${header.toJson()}";
    try {
      LOG.i(log);
      final response = await dio.delete(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: header.toJson(),
        ),
      );
      LOG.i('[DELETE] $url Response: ${response.data}');
      return HttpUtil.handleResponse(response);
    } catch (e) {
      LOG.e(log);
      throw _handleErrorRes(e, url);
    }
  }

  Future<dynamic> getResponseFromApi({required String? api}) async {
    try {
      final Response response = await Dio().get(api!);
      return json.decode(response.data);
    } catch (e) {
      throw ServerException();
    }
  }

  dynamic _handleErrorRes(e, String? url) {
    if (e is DioException) {
      Response errRes = e.response ??
          Response(
            statusCode: 500,
            requestOptions: RequestOptions(path: '${ConfigNetwork.apiUrl}$url'),
          );
      return HttpUtil.handleResponse(errRes);
    }
  }
}
