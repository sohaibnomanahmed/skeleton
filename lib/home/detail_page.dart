import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DetailsProvider>().fetchOrg(widget.orgNum);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<DetailsProvider>().isLoading;
    final orgDetail = context.watch<DetailsProvider>().orgDetail;
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text(widget.name)),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : orgDetail == null
              ? const Center(
                  child: Text('Could not find company'),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Organization number: ${orgDetail.id}"),
                      if (orgDetail.address.isNotEmpty)
                        Text("Adress: ${orgDetail.address}"),
                      if (orgDetail.site.isNotEmpty)
                        Text("Website: ${orgDetail.site}"),
                      if (orgDetail.antallAnsatte != -1)
                        Text("Number of employees: ${orgDetail.antallAnsatte}"),
                      if (orgDetail.stiftelseDato.isNotEmpty)
                        Text("Start date: ${orgDetail.stiftelseDato}"),
                    ],
                  ),
                ),
    );
  }
}
