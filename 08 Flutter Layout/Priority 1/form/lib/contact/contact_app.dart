import 'package:flutter/material.dart';
import 'package:form/contact/contact_page.dart';

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
