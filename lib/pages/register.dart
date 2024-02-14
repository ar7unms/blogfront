
import 'package:flutter/material.dart';
import 'package:realblog/pages/loginpage.dart';
import 'package:realblog/services/userservices.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name="";
  String age="";
  String mobile="";
  String pincode="";
  String email="";
  String password="";
  TextEditingController n1 = new TextEditingController();
  TextEditingController n2 = new TextEditingController();
  TextEditingController n3 = new TextEditingController();
  TextEditingController n4 = new TextEditingController();
  TextEditingController n5 = new TextEditingController();
  TextEditingController n6 = new TextEditingController();
  void SendApi() async
  {
    name=n1.text;
    age=n2.text;
    mobile=n3.text;
    pincode=n4.text;
    email = n5.text;
    password = n6.text;
    final response = await WelcomeApiService().sendData(name,age,mobile,pincode,email,password);
    if(response["status"]=="success")
    {
      showSimplePopup1(context, "Success!");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuPage()));
    }
    else
    {
      print("Error");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60.withOpacity(0.8),
      body: Container(
        padding: EdgeInsets.all(34),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 75,
              ),
              Text("REGISTER",style: TextStyle(fontSize: 40)),
              SizedBox(
                height: 15,
              ),
              TextField(
                  style: TextStyle(color: Colors.black),
                  controller: n1,
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.black),
                  )
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                controller: n2,
                decoration: InputDecoration(
                  labelText: "Age",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                controller: n3,
                decoration: InputDecoration(
                  labelText: "Mobile No",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                controller: n4,
                decoration: InputDecoration(
                  labelText: "Pin Code",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                controller: n5,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                controller: n6,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(width: 400,
                child: ElevatedButton(style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(4))),
                onPressed:SendApi, child: Text("Register")),
              )
            ],
          ),
        ),
      ),
    );
  }
  void showSimplePopup1(BuildContext context, String s) {
    final snackBar = SnackBar(
      content: Text(s,style: TextStyle(color: Colors.black),),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white70,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}