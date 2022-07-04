import 'package:ehliyetim/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String? hint;

  Future<void> getHint() async {
    hint = await ApiService().getHint();
    notifyListeners();
  }
}
