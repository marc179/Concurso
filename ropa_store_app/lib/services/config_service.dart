import 'package:flutter/foundation.dart';

class ConfigService {
  static String get baseUrl {
    if (kIsWeb) {
      // Flutter Web (Chrome)
      return 'http://127.0.0.1:5295';
    } else {
      // Flutter móvil (Android o iOS)
      return 'http://192.168.105.10:5295';
    }
  }
}
