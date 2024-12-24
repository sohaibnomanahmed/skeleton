import 'dart:async';

import 'package:get/get.dart';
import 'package:test/home/models/org_item.dart';
import 'package:test/home/brreg_service.dart';

class HomeProvider extends GetxController {
  final RxList<OrgItem> _orgs = <OrgItem>[].obs;
  final _isLoading = false.obs;
  var _page = 0.obs;

  RxBool get isLoading => _isLoading;
  RxList<OrgItem> get orgs => _orgs;

  void searchByName(String name) async {
    _isLoading.value = true;
    _page.value = 0;

    try {
      final orgs = await BrregService().getOrgsFromPage(name, _page.value);
      if (orgs == null) {
        _isLoading.value = false;
        _orgs.value = [];
        return;
      }
      _orgs.value = orgs;
      _isLoading.value = false;
    } on TimeoutException catch (_) {
      
    } catch (error) {
      //print('Failed to fetch more orgs: $error');
      _isLoading.value = false;
      return;
    }
  }

  void searchForMore(String name) async {
    _page += 1;

    try {
      final orgs = await BrregService().getOrgsFromPage(name, _page.value);
      if (orgs == null) {
        return;
      }
      _orgs.addAll(orgs);
    } on TimeoutException catch (_) {
      
    } catch (error) {
      //print('Failed to fetch more orgs: $error');
      return;
    }
  }
}
