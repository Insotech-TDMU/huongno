import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: AppColors.lightGrey, width: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
