import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:form/contact_model.dart';
import 'package:form/reusable_widget.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  var nameController = TextEditingController();
  var numberController = TextEditingController();
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.grey;

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
        form(),
      ],
    );
  }

  Widget form() {
    return Column(
      children: [
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
        buildDatePicker(context),
        const SizedBox(height: 15),
        buildColorPicker(context),
        const SizedBox(height: 15),
        buildFilePicker(context),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              onPressed: () {
                _submitDate();
              },
              child: const Text('Select'),
            )
          ],
        ),
        Text(
          DateFormat('dd-MM-yyyy').format(_dueDate),
        ),
      ],
    );
  }

  void _submitDate() async {
    final selectDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1990),
      lastDate: DateTime(currentDate.year + 5),
    );
    setState(() {
      if (selectDate != null) {
        _dueDate = selectDate;
      }
    });
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _submitColor(_currentColor);
            },
            child: const Text('Pick Color'),
          ),
        )
      ],
    );
  }

  void _submitColor(Color color) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick Your Color'),
          content: BlockPicker(
            pickerColor: _currentColor,
            onColorChanged: (color) {
              setState(() {
                _currentColor = color;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Save'),
            )
          ],
        );
      },
    );
  }

  Widget buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pick Files'),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _pickFile();
            },
            child: const Text('Pick and open file'),
          ),
        )
      ],
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    // Mendapatkan file dari result
    final file = result.files.first;
    // _openFile(file);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
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
      final date = _dueDate;
      final color = _currentColor;
      submittedData.add(Contact(
        name,
        number,
        date,
        color,
      ));
      for (var contact in submittedData) {
        print('Name: ${contact.name}');
        print('Phone Number: ${contact.phoneNumber}');
        print('Date: ${contact.date}');
        print('Color: ${contact.color}');
        print('-------------------');
      }
      isDataSubmitted = true;
      nameController.clear();
      numberController.clear();
    });
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
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this contact?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  submittedData.removeAt(index);
                });
                Navigator.of(context).pop();
              },
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
      },
    );
  }

  void _editContact(int index) {
    final contact = submittedData[index];
    TextEditingController nameController = TextEditingController(text: contact.name);
    TextEditingController phoneNumberController =
        TextEditingController(text: contact.phoneNumber);
    DateTime _editingDate = contact.date;
    Color _editingcolor = contact.color;

    showDialog(
      context: context,
      builder: (BuildContext context) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Date'),
                  TextButton(
                    onPressed: () async {
                      final selectDate = await showDatePicker(
                        context: context,
                        initialDate: _editingDate,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(_editingDate.year + 5),
                      );
                      setState(() {
                        if (selectDate != null) {
                          _editingDate = selectDate;
                        }
                      });
                    },
                    child: const Text('Select'),
                  ),
                ],
              ),
              Text(
                DateFormat('dd-MM-yyyy').format(_editingDate),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: _editingcolor,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Pick Your Color'),
                          content: BlockPicker(
                            pickerColor: _editingcolor,
                            onColorChanged: (color) {
                              setState(() {
                                _editingcolor = color;
                              });
                            },
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Save'),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Pick Color'),
                ),
              )
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  submittedData[index] = Contact(nameController.text,
                      phoneNumberController.text, _editingDate, _editingcolor);
                });
                Navigator.of(context).pop();
              },
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
      },
    );
  }
}

class ContactListItem extends StatelessWidget {
  final Contact contact;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ContactListItem({
    super.key,
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
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(contact.phoneNumber),
          Text(_formatDate(contact.date)),
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                color: contact.color,
              ),
              const SizedBox(width: 8),
              Text(
                  'Color: ${contact.color.value.toRadixString(16).padLeft(9, '#').toUpperCase()}'),
            ],
          )
        ],
      ),
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

  String _formatDate(DateTime date) {
    final dayOfWeek = DateFormat('EEEE').format(date);
    final dayOfWeekInIndonesian = _getDayOfWeekInIndonesian(dayOfWeek);
    final formattedDate = DateFormat('dd - MM - yyyy').format(date);
    return '$dayOfWeekInIndonesian, $formattedDate';
  }

  String _getDayOfWeekInIndonesian(String dayOfWeek) {
    switch (dayOfWeek) {
      case 'Monday':
        return 'Senin';
      case 'Tuesday':
        return 'Selasa';
      case 'Wednesday':
        return 'Rabu';
      case 'Thursday':
        return 'Kamis';
      case 'Friday':
        return 'Jumat';
      case 'Saturday':
        return 'Sabtu';
      case 'Sunday':
        return 'Minggu';
      default:
        return dayOfWeek;
    }
  }
}
