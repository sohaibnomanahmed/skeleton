import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = 'settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.dark_mode)),
            title: Text("Theme mode:"),
            trailing: DropdownButton(items: [DropdownMenuItem(child: Text("haha"))], onChanged: (_){}),
          )
        ],
      ),
    );
  }
}