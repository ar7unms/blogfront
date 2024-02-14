import 'package:flutter/material.dart';
import 'package:realblog/pages/menu.dart';
import 'package:realblog/pages/register.dart';
import 'package:realblog/pages/selectedpage.dart';
import 'package:realblog/services/userservices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String email="";
  String password="";
  TextEditingController n1 =new TextEditingController();
  TextEditingController n2=new TextEditingController();
  void loginapi() async{
    email=n1.text;
    password=n2.text;
    final response= await WelcomeApiService().logData(email, password);
    if(response["status"]=="success"){
      print("success");
      String userid=response["userdata"]["_id"].toString();
      SharedPreferences.setMockInitialValues({});
      SharedPreferences preferences=await SharedPreferences.getInstance();
      preferences.setString("userid",userid);
      print(userid);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>selectpage()));
    }
    else if(response["status"]=="invalid user"){
      print("invalid user");
    }
    else if(response["status"]=="Invalid password")
      {
      print("invalid password");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan,),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 100,),
            CircleAvatar(radius: 50,
            child: Text("B",style: TextStyle(fontSize: 40),),),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 450,
              child: TextField(
                controller: n1,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    labelText: "Phone number,username or email address"
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 450,
              height: 50,
              child: TextField(
                controller: n2,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  labelText: "Password",
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgotten password?",
                  textAlign : TextAlign.right,
                  style: TextStyle(fontSize: 12,color: Colors.blue),),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 450,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                  ),onPressed: loginapi, child: Text("Log In")),
            ),
            SizedBox(
              height: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't you have account?", style: TextStyle(color: Colors.black),),
                TextButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                    ),onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                }, child: Text("Sign Up"))
              ],
            )

          ],
        ),
      ),
    );
  }
}