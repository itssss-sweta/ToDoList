import 'package:application1/screen/home.dart';
//import 'package:application1/screen/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To do List',
      home: Home(),
    );
  }
}
