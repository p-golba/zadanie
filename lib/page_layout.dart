import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {
  final Widget child;
  const PageLayout({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: child,
      ),
    );
  }
}
