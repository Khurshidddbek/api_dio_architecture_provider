import 'package:api_dio_architecture_provider/pages/create_page.dart';
import 'package:api_dio_architecture_provider/pages/home_page.dart';
import 'package:api_dio_architecture_provider/pages/update_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdatePage.id: (context) => UpdatePage(),
        CreatePage.id: (context) => CreatePage(),
      },
    );
  }
}