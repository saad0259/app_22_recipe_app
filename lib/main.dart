import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Manager',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: const TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
            // button: TextStyle(
            //   color: Colors.yellow,
            // )
          ),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                  )))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final dynamic appBar = Platform.isIOS
        ? CupertinoNavigationBar(
      middle: const Text("Recipe App"),
      leading: const Icon(CupertinoIcons.settings_solid),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: const Icon(CupertinoIcons.add),
            onTap: () => (){},
          )
        ],
      ),
    )
        : AppBar(
      title: const Text("Recipe App"),
      leading: Icon(Icons.menu),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        )
      ],
    );
    return Scaffold(
        appBar: appBar,
    );
  }
}


