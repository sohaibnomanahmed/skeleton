import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test/core/models/org_detail.dart';
import 'package:test/core/brreg_service.dart';

class DetailsProvider with ChangeNotifier {
  OrgDetail? _orgDetail;
  var _isLoading = false;

  bool get isLoading => _isLoading;
  OrgDetail? get orgDetail => _orgDetail;

  void fetchOrg(String orgNum) async {
    _isLoading = true;
    notifyListeners();

    try {
      final orgDetail = await BrregService().getOrgDetail(orgNum);
      if (orgDetail == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }
      _orgDetail = orgDetail;
      _isLoading = false;
      notifyListeners();
    } on TimeoutException catch (_) {
    } catch (error) {
      //print('Failed to fetch more orgs: $error');
      _isLoading = false;
      notifyListeners();
      return;
    }
  }
}
