import 'package:flutter/material.dart';
import 'package:taskpro/api_services/api_services.dart';

class HomeApiProvider extends ChangeNotifier {
  final _service = ApiService();
  bool isLoading = false;
  var _home_response;
  get home_response => _home_response;

  Future<void> homeApi(api) async {
    isLoading = true;
    notifyListeners();

    final response = await _service.serviceApi(api);

    _home_response = response;
    isLoading = false;
    notifyListeners();
  }
}
