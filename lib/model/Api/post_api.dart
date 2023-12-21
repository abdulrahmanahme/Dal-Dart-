import 'dart:convert';
import 'package:flutter_assignment/model/model/token_model.dart';

import '../../core/app_const/app_const.dart';
import '../../core/end_points/end_points.dart';
import '../model/psot_model.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  ApiRepository(this.client);
  http.Client client;
  Future<PostModel> getPosts({required page, required String endpoint}) async {
    final response = await http.get(
        Uri.parse(
            '${Endpoint.baseUrl}${Endpoint.subReddit}$endpoint?limit=$page'),
        headers: {
          "Authorization": "Bearer ${AppConst.getToken}",
        });
    if (response.statusCode == 200) {
      return PostModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Posts');
    }
  }

  Future<TokenModel> getToken() async {
    final response = await http.post(Uri.parse(Endpoint.tokenEndPinot), body: {
      "grant_type": "password",
      "username": "Standard_Yam_4408",
      "password": "123456789abdo"
    }, headers: {
      'authorization': AppConst.basicAuth
    });
    if (response.statusCode == 200) {
      var tokenData = TokenModel.fromJson(json.decode(response.body));
      AppConst.getToken = tokenData.accessToken;
      return tokenData;
    } else {
      throw Exception('Failed to load Posts');
    }
  }
}
