import 'package:apis_with_bloc/bloc/post_bloc_bloc.dart';
import 'package:apis_with_bloc/ui/api-ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PostBlocBloc(),
        child: MaterialApp(
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true),
            debugShowCheckedModeBanner: false,
            home: const ApiScreen()));
  }
}
