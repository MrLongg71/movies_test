import 'package:movies_test/core/models/base_error_res_model.dart';

class AppException implements Exception {
  final BaseErrorResModel err;

  AppException({required this.err});

  @override
  String toString() {
    return err.statusMessage.toString();
  }
}
