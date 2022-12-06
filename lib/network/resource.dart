import 'package:responsi/network/detail_matches_model.dart';
import 'package:responsi/network/matches_model.dart';

import 'base_network.dart';

class DetailDataSource {
  static DetailDataSource instance = DetailDataSource();
  Future<Map<String, dynamic>> loadDetail(String id) {
    return BaseNetwork.get("matches/${id}");
  }
   Future<List<dynamic>> loadListData() {
    return BaseNetwork.getListData("matches");
  }
}