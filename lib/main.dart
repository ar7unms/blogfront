import 'package:flutter/material.dart';
import 'package:realblog/pages/loginpage.dart';

void main()
{
runApp(Mainapp());
}
class Mainapp extends StatelessWidget {
  const Mainapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPage()
    );
  }
}
