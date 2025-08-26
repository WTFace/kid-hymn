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
      title: 'Hymn App', // This title is used by the OS task switcher, etc.
      theme: ThemeData(
        primarySwatch: Colors.indigo, // Or Colors.blue, Colors.green, etc.
        // You can also define darkTheme, themeMode, fonts, etc.
        // visualDensity: VisualDensity.adaptivePlatformDensity, // Adjusts density based on platform
      ),
      // The 'home' property specifies what the first screen of your app will be.
      // Since HymnAppScreen is now imported, this should work without errors.
      home: const HymnAppScreen(),
      debugShowCheckedModeBanner: false, // Optional: set to false to remove the debug banner
    );
  }
}
