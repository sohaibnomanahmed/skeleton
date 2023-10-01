import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test/models/org_detail.dart';

import 'package:test/models/org_item.dart';

class BrregService {
  Future<List<OrgItem>?> getOrgsFromPage(String name, int page) async {
    var url = Uri.parse(
        'https://data.brreg.no/enhetsregisteret/api/enheter?navn=$name&page=$page');
    var response = await http.get(url).timeout(const Duration(seconds: 5));
    final parsed = jsonDecode(response.body);

    if (parsed['_embedded'] == null) {
      return null;
    }

    final List orgs = parsed['_embedded']['enheter'];
    return orgs.map((e) => OrgItem.fromJson(e)).toList();
  }

  Future<OrgDetail?> getOrgDetail(String orgNum) async {
    var url =
        Uri.parse('https://data.brreg.no/enhetsregisteret/api/enheter/$orgNum');
    var response = await http.get(url).timeout(const Duration(seconds: 5));
    final parsed = jsonDecode(response.body);
    if (parsed == null) {
      return null;
    }
    return OrgDetail.fromJson(parsed);
  }
}
