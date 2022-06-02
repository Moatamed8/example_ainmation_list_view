import 'package:example_animation_list/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/book_data.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: BookData()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }

}

