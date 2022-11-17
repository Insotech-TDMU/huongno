import 'package:flutter/material.dart';
import 'package:huongno/constant/app_colors.dart';

class AppButtons {
  AppButtons._();

  static Widget elevatedButton({
    required void Function() onPressed,
    required String title,
    double? width,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        fixedSize: width != null ? Size(width, 45) : const Size.fromHeight(45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  static Widget outlinedButton({
    required void Function() onPressed,
    required String title,
    double? width,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColor.primary,
        fixedSize: width != null ? Size(width, 45) : const Size.fromHeight(45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
      child: Text(title),
    );
  }

  static Widget textButton({
    required void Function() onPressed,
    required String title,
    Alignment? alignment,
    Color foregroundColor = AppColor.primary,
    double? width,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
        alignment: alignment,
        fixedSize: width != null ? Size(width, 45) : const Size.fromHeight(45),
        elevation: 0,
      ),
      child: Text(title),
    );
  }
}
