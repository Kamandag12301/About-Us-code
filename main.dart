import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'basic_screen.dart';
//THIS IS A TEST TO SEE IF ANYTHING IS CHANGED

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 255, 160, 64)),
        ),
        home: BasicScreen(),
      ),
    );
  }
}
