import 'package:flutter/material.dart';
import 'package:store2_app/screens/home_page.dart';
import 'package:store2_app/screens/update_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'homePage':(context) => homePage(),
      UpdatePage.id:(context) => UpdatePage()
      }
      ,
      initialRoute: 'homePage',
    );
  }
}
