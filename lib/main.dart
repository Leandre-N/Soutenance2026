import 'package:flutter/material.dart';
import 'screens/screen.dart';
import 'theme.dart';

void main() {
  runApp(const SanteVibesApp());
}

class SanteVibesApp extends StatelessWidget {
  const SanteVibesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SantéVibes',
      home: const FamilyDashboardScreen(),
    );
  }
}
