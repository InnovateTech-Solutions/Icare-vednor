import 'package:flutter/material.dart';

class ImageDisplayWidget extends StatelessWidget {
  final String imageUrl;

  const ImageDisplayWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Display'),
      ),
      body: Center(
        child: imageUrl.isNotEmpty
            ? Image.network(
                imageUrl,
                height: 300,
              )
            : Container(
                height: 300,
                color: Colors.grey[200],
                child: const Center(
                  child: Text('No Image Available'),
                ),
              ),
      ),
    );
  }
}
