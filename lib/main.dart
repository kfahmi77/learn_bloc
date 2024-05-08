import 'package:belajar_bloc/init.dart';
import 'package:belajar_bloc/presentation/user/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage()
    );
  }
}
