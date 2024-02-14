
import 'package:flutter/material.dart';
import 'package:realblog/services/postservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key,});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  String post = "";
  TextEditingController n1 = new TextEditingController();


  void SendApi() async
  {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String userId = prefer.getString("userid") ?? "";
    post = n1.text;
    final response = await PostApiService().sendData(userId, post);
    if (response["status"] == "success") {
      print("post added");
    }
    else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.withOpacity(0.9),
      body: Container(
        padding: EdgeInsets.all(34),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 75,
              ),
              Text("New Post", style: TextStyle(fontSize: 40)),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 300,
                width: 300,
                child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: n1,
                    decoration: InputDecoration(
                      labelText: "enter the message",
                      labelStyle: TextStyle(color: Colors.black),
                    )
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(onPressed: SendApi, child: Text("Post Now")),
            ],
          ),
        ),
      ),
    );
  }
}