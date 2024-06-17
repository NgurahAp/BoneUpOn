import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Interactive Widgets'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            buildDatePicker(context),
            const SizedBox(height: 20),
            buildColorPicker(context),
            const SizedBox(height: 20),
            buildFilePicker(context),
          ],
        ),
      ),
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
    _openFile(file);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
