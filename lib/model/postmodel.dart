// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  String userid;
  String post;
  DateTime postdate;

  Post({
    required this.userid,
    required this.post,
    required this.postdate,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    userid: json["userid"],
    post: json["post"],
    postdate: DateTime.parse(json["postdate"]),
  );

  Map<String, dynamic> toJson() => {
    "userid": userid,
    "post": post,
    "postdate": postdate.toIso8601String(),
  };
}
