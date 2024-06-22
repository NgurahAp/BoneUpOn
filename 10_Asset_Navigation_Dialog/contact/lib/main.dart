import 'package:contact/contact_page.dart';
import 'package:contact/galerry/galerry_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const ContactPage(),
        '/galerry': (context) => const GalerryPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Bone Up On',
    );
  }
}
