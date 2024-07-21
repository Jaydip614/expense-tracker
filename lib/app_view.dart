import 'package:expenses_tracker/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expenses Tracker",
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: const Color(0xFFF3F3F3),
          onSurface: const Color(0xFF041B39),
          primary: const Color(0xFF00B2E7),
          secondary: const Color(0xFFE064F7),
          tertiary: const Color(0xFFFF8D6C),
          outline: Colors.grey.shade500,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
