import 'dart:io';

import 'package:flutter/material.dart';
import 'package:huongno/constant/app_colors.dart';

class GridImageCard extends StatelessWidget {
  const GridImageCard({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.secondary, width: .5),
        image: DecorationImage(
          image: FileImage(File(imagePath)),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}