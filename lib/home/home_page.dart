import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:test/home/detail_page.dart';

import 'home_provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var name = '';
  late bool lock;
  final HomeProvider controller = Get.put(HomeProvider());

  @override
  Widget build(BuildContext context) {
    lock = false;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (val) => name = val,
          onSubmitted: (_) => controller.searchByName(name),
          decoration: InputDecoration(
            hintText: 'Search for organizations',
            suffixIcon: IconButton(
              onPressed: () {
                controller.searchByName(name);
              },
              icon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : controller.orgs.isEmpty
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
              controller.searchForMore(name);
            }
          }
          return true;
        },
        child: ListView.builder(
          itemCount: controller.orgs.length,
          itemBuilder: (_, index) => ListTile(
            leading: const CircleAvatar(
              //backgroundImage: orgs[index].site.isEmpty ? null : NetworkImage('${orgs[index].site}/favicon.ico'),
            ),
            title: Text(controller.orgs[index].name),
            subtitle: Text(controller.orgs[index].address),
            onTap: () => context.pushNamed(
              DetailPage.routeName,
              extra: {
                'orgNum': controller.orgs[index].id,
                'name': controller.orgs[index].name
              },
            ),
          ),
        ),
      ),),
    );
  }
}
