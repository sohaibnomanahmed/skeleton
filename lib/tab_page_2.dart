import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/home/home_page.dart';
import 'package:test/settings/settings_page.dart';

class TabPage extends StatefulWidget {
  final String pageName;
  final Widget child;
  const TabPage({required this.pageName, required this.child});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _currentIndex = 0;

  final tabs = {0: HomePage.routeName, 1: SettingsPage.routeName};

  @override
  Widget build(BuildContext context) {
    print(widget.pageName);
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
        currentIndex:
            (widget.pageName.isEmpty || widget.pageName == HomePage.routeName)
                ? 0
                : widget.pageName == SettingsPage.routeName
                    ? 1
                    : 0,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          context.goNamed(tabs[index] ?? '/');
        },
      ),
    );
  }
}
