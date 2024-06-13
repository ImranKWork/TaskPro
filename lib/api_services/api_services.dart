import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taskpro/constants/strings.dart';

class ApiService {
  Future<dynamic> serviceApi(api) async {
    Map<String, String> headers = {};
    headers["Authorization"] =
        "Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx";
    headers["Content-Type"] = "application/json";

    var url = "${AppStrings.baseurl}$api";
    final uri = Uri.parse(url);
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    }
    return [];
  }
}
