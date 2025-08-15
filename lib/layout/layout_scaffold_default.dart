import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LayoutScaffoldDefault extends StatelessWidget {
  const LayoutScaffoldDefault({required this.navigationShell, Key? key})
      : super(key: key ?? const ValueKey<String>("LayoutScaffold"));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: navigationShell,
    );
  }
}