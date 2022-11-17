import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huongno/constant/app_colors.dart';

class MasterLayout extends StatefulWidget {
  const MasterLayout({
    super.key,
    this.title,
    this.drawer,
    this.body,
    this.actions,
    this.bottomNavigationBar,
    this.backgroundColor,
  });

  final Widget? title;
  final Widget? drawer;
  final Widget? body;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  @override
  State<MasterLayout> createState() => _MasterLayoutState();
}

class _MasterLayoutState extends State<MasterLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        titleTextStyle: const TextStyle(
          color: AppColor.primary,
          fontSize: 16,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white, // Navigation bar
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // Status bar
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: widget.actions,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      drawer: widget.drawer,
      backgroundColor: widget.backgroundColor ?? AppColor.background,
      body: widget.body,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
