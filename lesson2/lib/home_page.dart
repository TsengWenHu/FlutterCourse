import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {


  // final String account ;
  // final String password ;
  // HomePage({required this.account, required this.password});
  const HomePage({Key? key, required this.account, required this.password}) : super(key: key);
  final String account;
  final String password;


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home_sharp),
        title: Row(
          children: [Text('首頁')],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.account.isNotEmpty)
              Image.asset(
                "assets/images/chillies.png",
                height: 75.0,
                width: 75.0,
              ),
            // else
              // Text('account : '+ widget.account), //todo : 要加widget才能呼叫到account
              // Text('password : '+ widget.password), //todo : 要加widget才能呼叫到password

            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LogInPage()));
                },
                child: Text("我要登入"))
          ],
        ),
      ),
    );
  }
}
