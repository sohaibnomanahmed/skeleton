import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test/models/org_item.dart';
import 'package:test/service/brreg_service.dart';

class HomeProvider with ChangeNotifier {
  List<OrgItem> _orgs = [];
  var _isLoading = false;
  var _page = 0;

  bool get isLoading => _isLoading;
  List<OrgItem> get orgs => _orgs;

  void searchByName(String name) async {
    _isLoading = true;
    _page = 0;
    notifyListeners();

    try {
      final orgs = await BrregService().getOrgsFromPage(name, _page);
      if (orgs == null) {
        _isLoading = false;
        _orgs = [];
        notifyListeners();
        return;
      }
      _orgs = orgs;
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

  void searchForMore(String name) async {
    _page += 1;

    try {
      final orgs = await BrregService().getOrgsFromPage(name, _page);
      if (orgs == null) {
        notifyListeners();
        return;
      }
      _orgs.addAll(orgs);
      notifyListeners();
    } on TimeoutException catch (_) {
      
    } catch (error) {
      //print('Failed to fetch more orgs: $error');
      notifyListeners();
      return;
    }
  }
}
