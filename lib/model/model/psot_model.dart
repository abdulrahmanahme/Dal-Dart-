// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

class PostModel {
  PostData data;

  PostModel({
    required this.data,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        data: PostData.fromJson(json["data"]),
      );
}

class PostData {
  List<ChildPost> children;
  PostData({
    required this.children,
  });
  factory PostData.fromJson(Map<String, dynamic> json) => PostData(
        children:
            List<ChildPost>.from(json["children"].map((x) => ChildPost.fromJson(x))),
      );
}

class ChildPost {
  String kind;
  Post data;

  ChildPost({
    required this.kind,
    required this.data,
  });

  factory ChildPost.fromJson(Map<String, dynamic> json) => ChildPost(
        kind: json["kind"],
        data: Post.fromJson(json["data"]),
      );
}

class Post {
  String selftext;
  String title;

  Post ({
    required this.selftext,
    required this.title,
  });

  factory Post .fromJson(Map<String, dynamic> json) => Post (
        selftext: json["selftext"],
        title: json["title"],
      );
}

