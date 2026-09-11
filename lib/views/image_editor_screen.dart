import 'package:flutter/material.dart';

class ImageEditorScreen extends StatelessWidget {
  const ImageEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('In-App Image Editor')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.image, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text('Crop, Filter & Watermark Tools'),
          ],
        ),
      ),
    );
  }
}
