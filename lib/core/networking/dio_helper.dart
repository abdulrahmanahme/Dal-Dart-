import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio=Dio();

  static Future<Response> get({
    required String url,
    required String token,
    Map<String, dynamic>? queryParameters,
  }) async {
  
    dio.options.headers = {
      'Authorization':'Bearer $token'
    };
    return await dio.get(
      url,
      queryParameters: queryParameters,
     
    );
  }
}