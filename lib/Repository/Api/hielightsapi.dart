import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:instagram/Repository/Api_service/Api_client.dart';
import 'package:instagram/Repository/Model/Instagram_model.dart';
import 'package:instagram/Repository/Model/highlightsmodel.dart';

class Hielightsapi {
  final ApiClient apiClient = ApiClient();

  Future<Hielightsmodel> fetchData(String user) async {
    String endpoint = "api/instagram/highlights";

    Response response = await apiClient.invokeAPI(endpoint, 'POST', {
   "username":"$user"
    });

    if (kDebugMode) {
      print("STATUS: ${response.statusCode}");
      print("BODY: ${response.body}");
    }

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      return Hielightsmodel.fromJson(data);
    } else {
      throw Exception(
        "Failed to load instagramscreen (${response.statusCode})",
      );
    }
  }
}
