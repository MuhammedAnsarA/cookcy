import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cookcy/views/product/widgets/image_text_row.dart';

class IngredientsContainer extends StatelessWidget {
  final String image;
  final String text;
  const IngredientsContainer({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 5,
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageTextRow(image: image, text: text),
              const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                child: Text("2"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
