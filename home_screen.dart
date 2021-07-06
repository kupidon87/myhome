import 'dart:core';
import 'package:flutter/material.dart';
// Такое же виджет, как и SplashScreen, только передаём ему ещё и заголовок
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Формирование состояния виджета
class _HomeScreenState extends State<HomeScreen> {

  // В отличии от SplashScreen добавляем AppBar
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SingleChildScrollView(
        child: Center(
          child: Container(),
        ),
      )
    );

}