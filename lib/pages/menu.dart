import 'package:flutter/material.dart';
import 'package:realblog/pages/index0.dart';

class menupage extends StatefulWidget {
  const menupage({super.key});

  @override
  State<menupage> createState() => _menupageState();
}

class _menupageState extends State<menupage> {
  final List<Widget> pages=[
    index0(),

  ];
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(onTap: (index){
          print(index);
          setState(() {
            currentIndex=index;
          });
        },items: [BottomNavigationBarItem(icon: Icon(Icons.add),label:"Add Post"),
          BottomNavigationBarItem(icon: Icon(Icons.add),label:"viewall"),
          BottomNavigationBarItem(icon: Icon(Icons.add),label:"view my post"),],
      ),
      ),
    );
  }
}
