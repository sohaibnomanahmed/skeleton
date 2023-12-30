import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  final Widget child;
  const TabPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    print(key);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
      ]),
    );
  }
}
