import 'package:flutter/material.dart';
import 'package:path/path.dart';

Widget buildTextField({
  required TextEditingController controller,
  required String label,
  required String hint,
  required TextInputType keyboardType,
}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFE7E0EC),
      borderRadius: BorderRadius.circular(10.0),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 15.0,
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(
          color: Color(0xFF49454F),
        ),
        border: InputBorder.none,
      ),
      keyboardType: keyboardType,
    ),
  );
}

// Widget drawerWidget() {
  // return Drawer(
  //   child: ListView(
  //     padding: const EdgeInsets.all(20.0),
  //     children: [
  //       const DrawerHeader(
  //         child: Text(
  //           'App Navigation',
  //           style: TextStyle(fontSize: 24, color: Colors.black),
  //         ),
  //       ),
  //       ListTile(
  //         title: const Text('Home Page'),
  //         onTap: () {
  //           Navigator.of(context).pushNamed('/');
  //         },
  //       ),
  //       ListTile(
  //         title: const Text('Gallery Page'),
  //         onTap: () {
  //           Navigator.of(context).pushNamed('/galerry');
  //         },
  //       ),
  //     ],
  //   ),
  // );
// }
