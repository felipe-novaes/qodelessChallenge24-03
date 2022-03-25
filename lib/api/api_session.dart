import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lcadp/api/api_base.dart';
import 'package:lcadp/shared/models/session_device.dart';

class SessionDeviceAux extends ApiClientBase {
  Future<List<SessionDevice>> hackSession() async {
    var response = await GET(
        'https://572e-201-49-245-32.ngrok.io/api/SafeBox/HackSafeBox/1');
    final list = jsonDecode(response.body) as List;
    final hack = list.map((e) => SessionDevice.fromMap(e)).toList();
    print(hack);

    return hack;
  }

  Future<List<SessionDevice>> hackSessionAux() async {
    var response =
        await rootBundle.loadString("assets/database/sessionDevice.json");
    final list = jsonDecode(response) as List;
    final hack = list.map((e) => SessionDevice.fromMap(e)).toList();
    print(hack);

    return hack;
  }

  Future<int> getAmmount() async {
    var response =
        await GET('https://572e-201-49-245-32.ngrok.io/api/SafeBox/GetValue');
    final value = jsonDecode(response.body);

    print(value);
    return jsonDecode(response.body);
  }
}
