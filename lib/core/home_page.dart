import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var name = '';
  late bool lock;

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<HomeProvider>().isLoading;
    final orgs = context.watch<HomeProvider>().orgs;
    lock = false;
    return Scaffold(
        appBar: AppBar(
            title: TextField(
          onChanged: (val) => name = val,
          onSubmitted: (_) => context.read<HomeProvider>().searchByName(name),
          decoration: InputDecoration(
              hintText: 'Search for organizations',
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<HomeProvider>().searchByName(name);
                },
                icon: const Icon(Icons.search),
              )),
        )),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : orgs.isEmpty
                ? const Center(
                    child: Text("No items"),
                  )
                : NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels >
                          (scrollInfo.metrics.maxScrollExtent * 0.8)) {
                        if (!lock) {
                          // set lock to prevent multiple calls to the function
                          lock = true;
                          context.read<HomeProvider>().searchForMore(name);
                        }
                      }
                      return true;
                    },
                    child: ListView.builder(
                        itemCount: orgs.length,
                        itemBuilder: (_, index) => ListTile(
                              leading: const CircleAvatar(
                                  //backgroundImage: orgs[index].site.isEmpty ? null : NetworkImage('${orgs[index].site}/favicon.ico'),
                                  ),
                              title: Text(orgs[index].name),
                              subtitle: Text(orgs[index].address),
                              onTap: () => context.pushNamed('detail', extra: {
                                'orgNum': orgs[index].id,
                                'name': orgs[index].name
                              }),
                            )),
                  ));
  }
}
