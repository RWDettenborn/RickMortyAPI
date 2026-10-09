import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  final String image;
  final double width;

  const CharacterImage({super.key, required this.image, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: image,
        child: Image.network(
          image,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.person, size: width);
          },
        ),
      ),
    );
  }
}