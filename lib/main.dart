import 'package:rickandmortyapi/controller_binding.dart';
import 'package:flutter/material.dart';
import 'package:rickandmortyapi/screens/home.dart';
import 'package:get/get.dart';
import 'package:rickandmortyapi/screens/home.dart';
import 'controller_binding.dart';

void main() {
  ControllerBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Catálogo de Personagens',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Home(title: 'Personagens'),
    );
  }
}