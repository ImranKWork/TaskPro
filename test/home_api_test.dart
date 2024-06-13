import 'package:flutter_test/flutter_test.dart';
import 'package:taskpro/api_services/api_services.dart';
import 'package:taskpro/constants/strings.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  test("get buisnesses list", () async {
    Map<String, String> headers = {};
    headers["Authorization"] =
        "Bearer bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx";
    headers["Content-Type"] = "application/json";

    var url = "${AppStrings.baseurl}${AppStrings.businessapi}";
    final uri = Uri.parse(url);
    var response = await http.get(uri, headers: headers);

    expect(response.statusCode, 200);
  });
}
