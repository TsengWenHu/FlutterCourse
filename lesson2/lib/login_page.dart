import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  //create instance to control the input box, read the text entered by the user, listen for changes to the text.
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _account_validate = false; //do not show errText as default
  bool _password_validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登入"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _accountController,
            decoration: InputDecoration(
                labelText: "帳號", //框框名稱
                hintText: "請輸入帳號（email, 手機號碼）",
                errorText: _account_validate ? '帳號不可為空！' : null//TODO
                ),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: "密碼",
              hintText: "請輸入密碼",
              errorText: _password_validate ? '密碼不可為空！' : null
            ),
          ),
          ElevatedButton(
              // 按鍵狀態
              onPressed: () {
                if (_accountController.text.isEmpty ){
                  setState(() {
                    _account_validate = true;
                  });
                }else{
                  setState(() {
                    _account_validate = false;
                  });
                }


                if (_passwordController.text.isEmpty){
                  setState(() {
                    _password_validate = true;
                  });
                }else{
                  setState(() {
                    _password_validate = false;
                  });
                }

                if (_accountController.text.isEmpty ||
                    _passwordController.text.isEmpty) {
                  return; // if the condition meet, immediately ends the execution of the current method.
                }



                Navigator.of(context).push( //todo : why can't use pop
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                        account : _accountController.text,
                        password : _passwordController.text,
                      )),
                );

              },
              child: Text("登入"))
        ],
      ),
    );
  }
}
