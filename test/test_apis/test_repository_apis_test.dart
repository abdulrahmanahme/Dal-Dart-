import 'dart:convert';

import 'package:flutter_assignment/core/app_const/app_const.dart';
import 'package:flutter_assignment/core/end_points/end_points.dart';
import 'package:flutter_assignment/model/Api/post_api.dart';
import 'package:flutter_assignment/model/model/psot_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockHTTPClient extends Mock implements Client {}

void main() {
  late PostsApi  postsApi;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    postsApi = PostsApi (mockHTTPClient);
  });
  group('given PostRepository class when get Post function is called and status code is 200 then a Post model should be returned', () {
    test('Fetch and Parse PostModel endpoint /hot', () async {
      // Arrange

      when(
        () => mockHTTPClient.get(
          Uri.parse(Endpoint.hotTest),
        ),
      ).thenAnswer((_) async => http.Response(AppConst.jsonString, 200));

      // Act
      final response = await mockHTTPClient.get(
          Uri.parse(Endpoint.hotTest));
      final postModel = PostModel.fromJson(json.decode(response.body));

      // Assert
      expect(postModel, isA<PostModel>());
    });
  });

  test('Fetch and Parse PostModel for endpoint /new', () async {
    // Arrange
    when(
      () => mockHTTPClient.get(
        Uri.parse(Endpoint.newPoint),
      ),
    ).thenAnswer((_) async => http.Response(AppConst.jsonString, 200));

    // Act
    final response = await mockHTTPClient
        .get(Uri.parse(Endpoint.newPoint));
    final postModel = PostModel.fromJson(json.decode(response.body));

    // Assert
    expect(postModel, isA<PostModel>());
  });

  test('Fetch and Parse PostModel for endpoint /rising', () async {
    // Arrange

    when(
      () => mockHTTPClient.get(
        Uri.parse(Endpoint.risingTest),
      ),
    ).thenAnswer((_) async => http.Response(AppConst.jsonString, 200));

    // Act
    final response = await mockHTTPClient
        .get(Uri.parse(Endpoint.risingTest));
    final postModel = PostModel.fromJson(json.decode(response.body));

    // Assert
    expect(postModel, isA<PostModel>());
  });
}
