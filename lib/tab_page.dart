// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class TabPage extends StatefulWidget {
//   const TabPage({super.key});

//   @override
//   State<TabPage> createState() => _TabPageState();
// }

// class _TabPageState extends State<TabPage> {
//   late final CupertinoTabController _cupertinoTabController;

//   @override
//   void initState() {
//     super.initState();
//     _cupertinoTabController = CupertinoTabController();
//   }

//   @override
//   void dispose() {
//     _cupertinoTabController.dispose();
//     super.dispose();
//   }

//   List<Widget> get _pages => [
//         CupertinoTabView(
//             builder: (ctx) => ChangeNotifierProvider(
//                 create: (_) => FollowProvider(), child: FollowPage()),
//             onGenerateRoute: dealsGeneratedRoutes),
//         CupertinoTabView(builder: (ctx) => SettingsPage())
//       ];

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//       controller: _cupertinoTabController,
//       tabBar: CupertinoTabBar(
//           border: const Border(top: BorderSide(color: Colors.grey, width: 0.1)),
//           backgroundColor: Theme.of(context).canvasColor.withOpacity(1),
//           items: const [
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.chrome_reader_mode), label: 'Home'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.settings), label: 'Settings'),
//           ]),
//       tabBuilder: (context, index) => _pages[index],
//     );
//   }
// }
