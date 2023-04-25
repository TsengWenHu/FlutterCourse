import 'package:flutter/material.dart';
import 'package:lesson3/ui/home_page.dart';

void main(){
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

