import 'package:flutter/material.dart';

class GalerryPage extends StatefulWidget {
  const GalerryPage({super.key});

  @override
  State<GalerryPage> createState() => _GalerryPageState();
}

class _GalerryPageState extends State<GalerryPage> {
  List<String> images = [
    'https://picsum.photos/id/1/200/200',
    'https://picsum.photos/id/2/200/200',
    'https://picsum.photos/id/3/200/200',
    'https://picsum.photos/id/4/200/200',
    'https://picsum.photos/id/5/200/200',
    'https://picsum.photos/id/6/200/200',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galerry Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom dalam grid
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.0),
                    ),
                  ),
                  context: context,
                  builder: (context) => Container(
                    width: double.infinity,
                    height: 350,
                    child: Column(
                      children: [
                        Image.network(images[index]),
                      ],
                    ),
                  ),
                );
              },
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
