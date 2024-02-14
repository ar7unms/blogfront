import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realblog/model/postmodel.dart';

class PostApiService
{
  Future<dynamic> sendData(
      String userId,String post
      ) async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://localhost:3006/api/post/post");
    var response = await client.post(apiUri,
      headers: <String,String>
      {
        "Content-Type":"application/json; charset=UTF-8"
      },
      body: jsonEncode(<String,String>
      {
        "userid" : userId,
        "post" : post
      }
      ),
    );
    if(response.statusCode==200)
    {
      var resp = response.body;
      return jsonDecode(resp);
    }
    else
    {
      throw Exception("Failed to send data");
    }
  }

  Future<List<Post>> getPosts() async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://local:3006/api/post/view");
    var response = await client.get(apiUri);
    if(response.statusCode == 200)
    {
      var resp = response.body;
      return postFromJson(resp);
    }
    else
    {
      return [];
    }
  }
}