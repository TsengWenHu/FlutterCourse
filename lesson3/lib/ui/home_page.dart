import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO 1. 宣吿sharepreferences物件，將sharepreferences的instance呼叫
  // 宣告instance物件 : Future開啟一個執行序(需要等待之後回饋的值, ex. 呼叫api or 我們這邊需要等待資料回傳的場景)
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController _accountController = TextEditingController();


  // stateful widget是有生命週期流程的，通常第一個流程為initState()，接下來才會是 Widget build()
  late Future<String> _account ;
  String keyAccount = "account";

  //定義function儲存account值 : 29分
  Future<void> save(String account) async {
    // TODO 4. 將填入欄位的值，透過shared preferences存放在本地端
    final SharedPreferences prefs = await _prefs; //等待值被輸入 並帶入
    setState(() {
      _account = prefs.setString(keyAccount, account).then((bool value) {
        return account;
      });
    });
  }

  // TODO 2. 將存放於儲存空間的值給取出
  // 設定initState()
  @override
  void initState() {
    super.initState();
    // 從本地端將值給帶出來
    _account = _prefs.then((SharedPreferences pref){
      return pref.getString(keyAccount) ?? ""; // ?? "" : 若為空值則補為""
      // 以下程式碼等價於上面return
      // if(pref.getString("account")==null){
      //   return "";
      // }
      // return pref.getString("account")!;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("RUBY APP"),
      ),
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                child: TextField(
                  controller: _accountController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(label: Text('帳號'), hintText: "請輸入帳號"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 36.0),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(label: Text('密碼'), hintText: "請輸入密碼"),
                ),
              ),
              ElevatedButton(onPressed: (){
                //TODO 5. 點擊送出時 執行save() function (宣告在最上面）
                if(_accountController.text.isEmpty){
                  return;
                }
                save(_accountController.text);
              }
                  , child: Text("登入")),
              Expanded(
                child: Center(
                  child: Container(
                    // D:\Flutter上課影片\Flutter-2023.04.13 下半場 24分
                    decoration: BoxDecoration(color: Colors.greenAccent),
                    child: FutureBuilder<String>(
                      future: _account,
                      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                        //TODO 3. 透過futurebuilder在節點產生時，將畫面生成，取出來的值'snapshot.data'給text widget
                        return Text(
                        snapshot.data!, // ! : 強制假設它一定有值
                        style: TextStyle(fontSize: 30),
                        );
                      }),
                      ),
                    ),
                  ),

            ],
          ),
        ),
      ),
    );
  }
}
