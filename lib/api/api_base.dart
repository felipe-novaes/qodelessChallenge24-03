import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:lcadp/core/app_settings.dart';

abstract class ApiClientBase {
  static String JwtToken = "";
  static String Role = "";
  static String UserName = "";

  Future<http.Response> GET(String endpoint) async {
    initHtttp();
    return await http.get(Uri.parse(AppSettings.apiUrl + endpoint),
        headers: getDefaultHeaders());
  }

  Future<http.Response> POST(String endpoint, Object bodyContent) async {
    initHtttp();
    try {
      return await http.post(Uri.parse(AppSettings.apiUrl + endpoint),
          headers: getDefaultHeaders(), body: jsonEncode(bodyContent));
    } catch (e) {
      return http.Response("", HttpStatus.internalServerError);
    }
  }

  Future<http.Response> PUT(String endpoint, Object bodyContent) async {
    initHtttp();
    return await http.put(Uri.parse(AppSettings.apiUrl + endpoint),
        headers: getDefaultHeaders(), body: jsonEncode(bodyContent));
  }

  void initHtttp() {
    // if (Platform.isIOS || Platform.isMacOS) {
    //   HttpClient client = new HttpClient();
    //   client.badCertificateCallback =
    //       ((X509Certificate cert, String host, int port) => true);
    // }
  }

  Map<String, String> getDefaultHeaders() {
    return {
      "accept": "application/json",
      "content-type": "application/json",
      "Authorization": 'Bearer ${JwtToken}',
    };
  }
}
