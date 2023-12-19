import 'dart:convert';
import '../../core/app_const/app_const.dart';
import '../../core/end_points/end_points.dart';
import '../model/psot_model.dart';
import 'package:http/http.dart' as http;

class PostsApi {
  PostsApi(this.client);
  http.Client client;
  Future<PostModel> getPosts({required page, required String endpoint}) async {
    final response = await http.get(
        Uri.parse(
            '${Endpoint.baseUrl}${Endpoint.subReddit}$endpoint?limit=$page'),
        headers: {
          "Authorization": "Bearer ${AppConst.token}",
        });
    if (response.statusCode == 200) {
      return PostModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Posts');
    }
  }
}
