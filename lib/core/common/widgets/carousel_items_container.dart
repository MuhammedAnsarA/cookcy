import 'package:flutter/material.dart';

class CarouselItemsContainer extends StatelessWidget {
  final String image;
  const CarouselItemsContainer({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
