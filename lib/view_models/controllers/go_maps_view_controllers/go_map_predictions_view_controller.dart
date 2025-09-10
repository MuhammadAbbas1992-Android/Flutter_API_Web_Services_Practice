import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_api_web_services_practice/res/app_url/app_url.dart';
import 'package:flutter_api_web_services_practice/res/app_utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GoMapPredictionsViewController extends GetxController {
  final searchTextController = TextEditingController().obs;
  RxList<dynamic> predictionsList = <dynamic>[].obs;

  Future<void> getPredictions(String input) async {
    String uri =
        '${AppUrl.goMapsBaseUrl}?input=$input&key=${AppUrl.goMapsApiKey}';
    try {
      await http
          .get(Uri.parse(uri))
          .timeout(const Duration(seconds: 10))
          .then((response) {
        if (kDebugMode) {
          print(response);
        }
        if (response.statusCode == 200) {
          predictionsList.clear();
          var data = json.decode(response.body);
          predictionsList.assignAll(data['predictions']);
        } else {
          throw Exception('Failed to load Predictions ${response.statusCode}');
        }
      });
    } catch (e) {
      AppUtils.mySnackBar(title: 'Error', message: '$e');
    }
  }
}
