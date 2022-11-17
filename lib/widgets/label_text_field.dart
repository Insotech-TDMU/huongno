import 'package:flutter/material.dart';
import 'package:huongno/constant/app_colors.dart';
import 'package:huongno/constant/app_font_size.dart';

// ignore: must_be_immutable
class LabelTextField extends StatelessWidget {
  LabelTextField({
    Key? key,
    required this.title,
    this.controller,
    this.inputType,
    this.maxCharacter,
    this.validator,
    this.obscureText = false,
    this.suffix,
    this.readOnly = false,
    this.onChanged,
    this.errorText,
    this.maxLine,
    this.hintText,
  }) : super(key: key);

  final String title;
  TextEditingController? controller;
  TextInputType? inputType;
  int? maxCharacter;
  int? maxLine;
  String? Function(String?)? validator;
  void Function(String?)? onChanged;
  bool obscureText;
  Widget? suffix;
  bool readOnly;
  String? errorText;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: AppFontSize.normal,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            maxLength: maxCharacter,
            maxLines: maxLine,
            obscureText: obscureText,
            readOnly: readOnly,
            style: const TextStyle(
              fontSize: AppFontSize.medium,
              decoration: TextDecoration.none,
              color: Colors.black,
            ),
            keyboardType: inputType,
            decoration: InputDecoration(
              counterText: '',
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:const BorderSide(
                  color: AppColor.primary,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              errorStyle:const TextStyle(
                color: AppColor.primary,
                fontSize: AppFontSize.small,
              ),
              errorText: errorText,
              suffixIcon: suffix,
              iconColor: AppColor.primary,
            ),
          ),
        ),
      ],
    );
  }
}
