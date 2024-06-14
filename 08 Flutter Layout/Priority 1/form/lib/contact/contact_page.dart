import 'package:flutter/material.dart';
import 'package:form/contact/contact_model.dart';
import 'package:form/contact/reusable_widget.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  var nameController = TextEditingController();
  var numberController = TextEditingController();

  bool isDataSubmitted = false;
  List<Contact> submittedData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            header(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  submitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              final name = nameController.text;
              final number = numberController.text;
              submittedData.add(
                Contact(name, number),
              );
              // for (var contact in submittedData) {
              //   print('Name: ${contact.name}, Phone Number: ${contact.phoneNumber}');
              // }
              isDataSubmitted = true;
              nameController.clear();
              numberController.clear();
            });
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: const Color(0xFF6750A4),
          ),
          child: const Text('Submit'),
        ),
      ],
    );
  }

  header() {
    return Column(
      children: [
        const SizedBox(height: 90),
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
        buildTextField(
          controller: nameController,
          label: 'Name',
          hint: 'Enter Your Name',
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 15),
        buildTextField(
          controller: numberController,
          label: 'Phone Number',
          hint: '+62...',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  listData() {
    return Column(
      children: [
        Text('List Contacts'),
        ListView.builder(
          itemCount: submittedData.length,
          itemBuilder: (context, index) {
            final contact = submittedData[index];
            return ListTile();
          },
        )
      ],
    );
  }
}
