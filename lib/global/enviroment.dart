import 'dart:io';

class Environment {
  static String apiUrl = Platform.isAndroid
      ? 'http://10.0.2.2:8080/api'
      : "htto://localhost:8080/api";
  static String socketUrl =
      Platform.isAndroid ? 'http://10.0.2.2:8080/' : "http://localhost:8080/";
}
