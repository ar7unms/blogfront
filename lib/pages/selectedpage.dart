import 'package:flutter/material.dart';
import 'package:realblog/pages/postpage.dart';

class selectpage extends StatefulWidget {
  const selectpage({super.key});

  @override
  State<selectpage> createState() => _selectpageState();
}

class _selectpageState extends State<selectpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ElevatedButton(style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
        ), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PostPage()));
            }, child: Text("POST")),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
              ),
                onPressed: (){

            }, child: Text("View")),

          ],
        ),
      ),
    );
  }
}
