import 'package:assignment/utils/home_screen_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(
    Provider(
      create: (context) => HomeScreenData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 245, 210, 222),
        primaryColor: const Color.fromARGB(255, 245, 210, 222),
        focusColor: const Color.fromARGB(255, 74, 73, 73),
      ),
      home: const MainScreen(),
    );
  }
}
