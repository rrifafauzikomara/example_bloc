import 'package:example_bloc/bloc/home_bloc.dart';
import 'package:example_bloc/data/api_service.dart';
import 'package:example_bloc/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => HomeBloc(apiService: ApiService()),
        child: const HomePage(),
      ),
    );
  }
}
