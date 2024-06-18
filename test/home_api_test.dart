import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:taskpro/api_services/api_services.dart';
import 'package:taskpro/constants/strings.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  test("API Success Test", () async {
    Map<String, String> headers = {};
    headers["Authorization"] =
        "Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx";
    headers["Content-Type"] = "application/json";

    var url = "${AppStrings.baseurl}${AppStrings.businessapi}";
    final uri = Uri.parse(url);
    var response = await http.get(uri, headers: headers);

    expect(response.statusCode, 200);
  });
  
  test('Test list Empty or Not', () async {
    Map<String, String> headers = {};
    headers["Authorization"] =
        "Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx";
    headers["Content-Type"] = "application/json";

    var url = "${AppStrings.baseurl}${AppStrings.businessapi}";
    final uri = Uri.parse(url);
    var response = await http.get(uri, headers: headers);
    final json = jsonDecode(response.body);
    var jsonResponse = json as Map<String, dynamic>;
    var buisnesslist = jsonResponse["businesses"];
    expect(buisnesslist.isNotEmpty, true);
  });

  test('Test list elements', () async {
    Map<String, String> headers = {};
    headers["Authorization"] =
        "Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx";
    headers["Content-Type"] = "application/json";

    var url = "${AppStrings.baseurl}${AppStrings.businessapi}";
    final uri = Uri.parse(url);
    var response = await http.get(uri, headers: headers);
    final json = jsonDecode(response.body);
    var jsonResponse = json as Map<String, dynamic>;
    var buisnesslist = jsonResponse["businesses"];
    expect(buisnesslist[0].toString().contains("name"), true); 
    expect(buisnesslist[0].toString().contains("price"), true); 
    expect(buisnesslist[0].toString().contains("is_closed"), true);
    expect(buisnesslist[0].toString().contains("image_url"), true);
    expect(buisnesslist[0].toString().contains("rating"), true); 
    expect(buisnesslist[0].toString().contains("distance"), true); 
    expect(buisnesslist[0].toString().contains("location"), true); 
  });
}
