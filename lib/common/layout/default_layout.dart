import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout(
      {super.key,
      required this.child,
      this.backgroundColor = Colors.white,
      this.title,
      this.bottomNavigationBar});

  final Widget child;
  final Color? backgroundColor;
  final String? title;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: renderAppBar(title),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

AppBar? renderAppBar(String? title) {
  if (title == null) {
    return null;
  } else {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
      foregroundColor: Colors.black,
    );
  }
}
