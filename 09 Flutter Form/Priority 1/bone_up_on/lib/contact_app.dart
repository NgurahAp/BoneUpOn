import 'package:bone_up_on/contact_page.dart';
import 'package:flutter/material.dart';

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactPage(),
    );
  }
}
