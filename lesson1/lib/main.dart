import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainApp(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'OoohBaby',
      )); //首頁
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

// function that randomly generate name as output
String random_name() {
  final names = [
    'Alice',
    'Bob',
    'Charlie',
    'Dave',
    'Eve',
    'Frank',
    'Grace',
    'Henry',
    'Ivy',
    'Jack',
    'Kate',
    'Luke',
    'Mia',
    'Nina',
    'Oliver',
    'Pam',
    'Quincy',
    'Rose',
    'Samantha',
    'Tom',
    'Uma',
    'Violet',
    'Wendy',
    'Xander',
    'Yara',
    'Zoe'
  ];
  return names[Random().nextInt(names.length)];
}

// function that randomly generate font family as output
FontStyle random_font() {
  final font_styles = [FontStyle.normal, FontStyle.italic];
  return font_styles[Random().nextInt(font_styles.length)];
}

// function that randomly generate color as output
ColorSwatch random_color() {
  final color_styles = [
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.brown,
    Colors.tealAccent,
    Colors.deepPurple,
    Colors.greenAccent
  ];
  return color_styles[Random().nextInt(color_styles.length)];
}

class _MainAppState extends State<MainApp> {
  //設定文字內容
  int value = 0;

  //設定字體大小
  double add_font_size = 10;

  //隨機產生名字
  String random_name_output = 'Ruby';

  //變換字體
  FontStyle random_font_output = FontStyle.italic;

  //變換顏色
  ColorSwatch random_color_output = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Icon(Icons.add_call), //Text("Hello World"),
          centerTitle: true,
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  "$value",
                  style: TextStyle(
                      color: random_color_output,
                      fontSize: add_font_size,
                      fontStyle: random_font_output,
                      // fontFamily: 'OoohBaby'
                  ),
                ), //使用前面定義的value變數
                Text("$random_name_output",
                    style: TextStyle(
                        color: random_color_output,
                        fontSize: add_font_size,
                        fontStyle: random_font_output)),
                SizedBox(height: 20.0),
                ElevatedButton(
                    onPressed: () {
                      //這個按鈕要做的事情
                      setState(() {
                        value++; //value = "今天天氣陰";
                      });
                      if (kDebugMode) {
                        print("$value");
                      }
                    },
                    child: Text("點擊 + 1")),
                SizedBox(height: 5.0),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        add_font_size = add_font_size + 5;
                      });
                      if (kDebugMode) {
                        print("$add_font_size");
                      }
                    },
                    child: Text("放大字體 +5")),
                SizedBox(height: 5.0),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        add_font_size = add_font_size - 5;
                      });
                      if (kDebugMode) {
                        print("$add_font_size");
                      }
                    },
                    child: Text("縮小字體 -5")),
                SizedBox(height: 5.0),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        random_name_output = random_name();
                      });
                    },
                    child: Text('產生名字')),
                SizedBox(height: 5.0),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        random_font_output = random_font();
                      });
                    },
                    child: Text('變換字體')),
                SizedBox(height: 5.0),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        random_color_output = random_color();
                      });
                    },
                    child: Text('變換顏色'),
                    style: ButtonStyle(
                        backgroundColor:  MaterialStateProperty.resolveWith((states) => Colors.amber),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(color: Colors.amber))))),
                SizedBox(height: 5.0),
              ],
            )) //Container()可以使用容器行編排，可放多個東西, Center()直接置中

        );
  }
}
