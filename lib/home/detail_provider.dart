import 'dart:async';

import 'package:get/get.dart';
import 'package:test/home/models/org_detail.dart';
import 'package:test/home/brreg_service.dart';

class DetailsProvider extends GetxController {
  final _orgDetail = Rxn<OrgDetail?>();
  final _isLoading = false.obs;

  RxBool get isLoading => _isLoading;
  Rxn<OrgDetail?> get orgDetail => _orgDetail;

  void fetchOrg(String orgNum) async {
    _isLoading.value = true;

    try {
      final orgDetail = await BrregService().getOrgDetail(orgNum);
      if (orgDetail == null) {
        _isLoading.value = false;
        return;
      }
      _orgDetail.value = orgDetail;
      _isLoading.value = false;
    } on TimeoutException catch (_) {
    } catch (error) {
      //print('Failed to fetch more orgs: $error');
      _isLoading.value = false;
      return;
    }
  }
}
