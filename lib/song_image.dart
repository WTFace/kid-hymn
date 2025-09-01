import 'package:flutter/material.dart';

class SongImage extends StatelessWidget {
  final int pageNumber;
  final String title;

  const SongImage({super.key, required this.pageNumber, required this.title});

  @override
  Widget build(BuildContext context) {
    final currentImagePath = 'assets/hymns/$pageNumber.jpg';
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
          child: InteractiveViewer(
            // minScale: 0.5,
            maxScale: 3.0,
            child: Image.asset(
              currentImagePath,
              fit: BoxFit.fitWidth,
            ),
          )

      )
    );
  }
}