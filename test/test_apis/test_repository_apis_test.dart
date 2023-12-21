import 'dart:convert';

import 'package:flutter_assignment/core/app_const/app_const.dart';
import 'package:flutter_assignment/core/end_points/end_points.dart';
import 'package:flutter_assignment/model/model/psot_model.dart';
import 'package:flutter_assignment/model/model/token_model.dart';
import 'package:flutter_assignment/view_model/cubit/post_view_model_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockHTTPClient extends Mock implements Client {}

void main() {
  late MockHTTPClient mockHTTPClient;
  late PostViewModel postViewModel;
  setUp(() {
    mockHTTPClient = MockHTTPClient();
  });
  group(
      'given PostRepository class when get Post function is called and status code is 200 then a Post model should be returned',
      () {
    test('Fetch and Parse PostModel endpoint /hot', () async {
      // Arrange

      when(
        () => mockHTTPClient.get(
          Uri.parse(Endpoint.hotTest),
        ),
      ).thenAnswer((_) async => http.Response(AppConst.jsonString, 200));

      // Act
      final response = await mockHTTPClient.get(Uri.parse(Endpoint.hotTest));
      final postModel = PostModel.fromJson(json.decode(response.body));

      // Assert
      expect(postModel, isA<PostModel>());
    });
    test('Fetch and Parse PostModel for endpoint /new', () async {
      // Arrange
      when(
        () => mockHTTPClient.get(
          Uri.parse(Endpoint.newPoint),
        ),
      ).thenAnswer((_) async => http.Response(AppConst.jsonString, 200));
      // Act
      final response = await mockHTTPClient.get(Uri.parse(Endpoint.newPoint));
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
      final response = await mockHTTPClient.get(Uri.parse(Endpoint.risingTest));
      final postModel = PostModel.fromJson(json.decode(response.body));
      // Assert
      expect(postModel, isA<PostModel>());
    });
  });

  group('Test Token Model', () {
    test('Fetch and Parse token for endpoint /token', () async {
      // Arrange

      when(
        () => mockHTTPClient.get(
          Uri.parse(Endpoint.tokenEndPinot),
        ),
      ).thenAnswer((_) async => http.Response(AppConst.tokenBody, 200));

      // Act
      final response =
          await mockHTTPClient.get(Uri.parse(Endpoint.tokenEndPinot));
      final tokenModel = TokenModel.fromJson(json.decode(response.body));

      // Assert
      expect(tokenModel, isA<TokenModel>);
    });
  });

  group('TokenModel', () {
    test('fromJson should create a TokenModel instance from JSON', () {
      final Map<String, dynamic> jsonData = {
        "access_token": "your_access_token",
        "token_type": "bearer",
        "expires_in": 3600,
        "scope": "read write",
      };

      final tokenModel = TokenModel.fromJson(jsonData);
      expect(tokenModel.accessToken, equals("your_access_token"));
    });
  });
}
