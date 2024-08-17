import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigNetwork {
  static final String baseUrl = '${dotenv.env['BASE_URL']}';
  static final String apiToken = '${dotenv.env['API_TOKEN']}';
  static const int connectTimeout = 30000;
  static const int responseTimeout = 30000;
}
