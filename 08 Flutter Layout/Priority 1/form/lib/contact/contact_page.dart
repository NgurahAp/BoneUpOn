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
        child: ListView(
          children: [
            header(),
            submitButton(),
            if (isDataSubmitted) listData(),
          ],
        ),
      ),
    );
  }

  Widget submitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: _submitData,
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

  void _submitData() {
    setState(() {
      final name = nameController.text;
      final number = numberController.text;
      submittedData.add(Contact(name, number));
      isDataSubmitted = true;
      nameController.clear();
      numberController.clear();
    });
  }

  Widget header() {
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

  Widget listData() {
    return Column(
      children: [
        const Text('List Contacts'),
        ListView.builder(
          shrinkWrap: true,
          itemCount: submittedData.length,
          itemBuilder: (context, index) {
            final contact = submittedData[index];
            return ContactListItem(
              contact: contact,
              onEdit: () => _editContact(index),
              onDelete: () => _deleteContact(index),
            );
          },
        ),
      ],
    );
  }

  void _deleteContact(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeleteContactDialog(
          onConfirm: () {
            setState(() {
              submittedData.removeAt(index);
            });
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void _editContact(int index) {
    final contact = submittedData[index];
    TextEditingController nameController = TextEditingController(text: contact.name);
    TextEditingController phoneNumberController =
        TextEditingController(text: contact.phoneNumber);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditContactDialog(
          nameController: nameController,
          phoneNumberController: phoneNumberController,
          onSave: () {
            final newName = nameController.text;
            final newPhoneNumber = phoneNumberController.text;

            setState(() {
              submittedData[index] = Contact(newName, newPhoneNumber);
            });

            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}

class ContactListItem extends StatelessWidget {
  final Contact contact;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ContactListItem({super.key, 
    required this.contact,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final firstLetter = contact.name.substring(0, 1).toUpperCase();
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.purple[300],
        child: Text(
          firstLetter,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.phoneNumber),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

class DeleteContactDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const DeleteContactDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Deletion'),
      content: const Text('Are you sure you want to delete this contact?'),
      actions: <Widget>[
        ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: const Color(0xFF6750A4),
          ),
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: Colors.white,
          ),
          child: const Text(
            'No',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class EditContactDialog extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final VoidCallback onSave;

  const EditContactDialog({super.key, 
    required this.nameController,
    required this.phoneNumberController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Contact'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: phoneNumberController,
            decoration: const InputDecoration(labelText: 'Phone Number'),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: onSave,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: const Color(0xFF6750A4),
          ),
          child: const Text('Save'),
        ),
      ],
    );
  }
}
