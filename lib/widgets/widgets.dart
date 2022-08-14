import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage(
      {Key? key,
      this.borderRadius = 10.0,
      required this.image,
      this.margin = 8.0})
      : super(key: key);

  final double borderRadius;
  final String image;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
