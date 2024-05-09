import 'package:belajar_bloc/domain/repositories/user_repository.dart';
import 'package:belajar_bloc/init.dart';
import 'package:belajar_bloc/presentation/bloc/user/user_bloc.dart';
import 'package:belajar_bloc/presentation/user/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  setup();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: createBlocProviders(),
      child: const MaterialApp(
        title: 'My App',
        home: HomePage(),
      ),
    );
  }
}
