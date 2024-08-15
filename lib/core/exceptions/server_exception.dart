import 'package:movies_test/core/models/base_error_res_model.dart';

import 'app_exception.dart';

class ServerException extends AppException {
  ServerException({BaseErrorResModel? err})
      : super(
          err: err ??
              BaseErrorResModel(
                statusCode: 500,
                statusMessage: 'An error occurred, please try again later!',
              ),
        );
}
