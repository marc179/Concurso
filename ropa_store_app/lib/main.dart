import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const RopaStoreApp());
}

class RopaStoreApp extends StatelessWidget {
  const RopaStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RopaStore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const LoginScreen(),
    );
  }
}
