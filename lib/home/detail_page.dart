import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/home/detail_provider.dart';

class DetailPage extends StatefulWidget {
  static const routeName = 'detail';

  final String name;
  final String orgNum;
  const DetailPage({super.key, required this.orgNum, required this.name});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  final DetailsProvider controller = Get.put(DetailsProvider());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchOrg(widget.orgNum);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text(widget.name)),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.orgDetail.value == null) {
          return const Center(
            child: Text('Organization not found'),
          );
        }
        return Column(
          children: [
            Text(controller.orgDetail.value!.name),
            Text(controller.orgDetail.value!.address),
          ],
        );
      }),
    );
  }
}
