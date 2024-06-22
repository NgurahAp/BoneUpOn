import 'package:contact/contact_form.dart';
import 'package:contact/reusable_widget.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            header(),
            const ContactForm(),
          ],
        ),
      ),
      drawer:  Drawer(
    child: ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        const DrawerHeader(
          child: Text(
            'App Navigation',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
        ListTile(
          title: const Text('Home Page'),
          onTap: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
        ListTile(
          title: const Text('Gallery Page'),
          onTap: () {
            Navigator.of(context).pushNamed('/galerry');
          },
        ),
      ],
    ),
  ),
    );
  }

  Widget header() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/image/img1.png',
            width: 30,
            height: 30,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Create New Contacts',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
        ),
        const SizedBox(height: 20),
        const Divider(
          thickness: 1,
          color: Colors.deepPurple,
          indent: 10,
          endIndent: 10,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
