import 'dart:convert';
import '../../core/app_const/app_const.dart';
import '../../core/end_points/end_points.dart';
import '../../core/networking/dio_helper.dart';
import '../model/psot_model.dart';

class PostsApi {
  Future<PostModel> getPosts({required page,required String endpoint}) async {
    final response = await DioHelper.get(
      url: '${Endpoint.baseUrl}${Endpoint.subReddit}$endpoint?limit=$page',
      token: AppConst.token,
    );
    if (response.statusCode == 200) {
      return PostModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load Posts');
    }
  }
}
