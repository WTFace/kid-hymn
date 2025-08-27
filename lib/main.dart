import 'package:flutter/material.dart';
import 'hymn_app_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hymn App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        // scaffoldBackgroundColor: Colors.grey, //  DEFAULT SCAFFOLD BACKGROUND
      ),

      home: const HymnAppScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
