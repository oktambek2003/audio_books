import 'package:flutter/material.dart';
import 'package:market/detail_audio.dart';
import 'package:market/my_home_page.dart';
void main(List<String> args) {
  return runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Flutter audio App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: DetailAudio()
    );
  }
}
