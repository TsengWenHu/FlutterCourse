import 'package:flutter/material.dart';

import 'home_page.dart';

void main(){
  runApp(const NavigatorApp());

}

class NavigatorApp extends StatelessWidget {
  const NavigatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  HomePage(account: '',password: '',),

    );
  }
}
