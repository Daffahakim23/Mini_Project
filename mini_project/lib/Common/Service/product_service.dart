import 'package:dio/dio.dart';
import '../common.dart';

class WatchService {
  Future<WatchItemsResponse> getListWatch() async {
    try {
      final response = await Dio().get('$url/db');

      return WatchItemsResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Failed Get Watch $e');
    }
  }

Future<DetailWatchResponse> getDetailWatch(String watchId) async {
    try {
      final response = await Dio().get('$url/products/$watchId');
      if (response.statusCode == 200) {
        return DetailWatchResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load watch detail');
      }
    } catch (e) {
      throw Exception('Failed to load watch detailll: $e');
    }
  }

  // Future<DetailWatchResponse> updateDetailWatch(
  //     String watchId, DetailWatchRequest request) async {
  //   try {
  //     final response =
  //         await Dio().put('$url/products/$watchId', data: request.toJson());
  //     if (response.statusCode == 200) {
  //       return DetailWatchResponse.fromJson(response.data);
  //     } else {
  //       throw Exception('Failed to update watch detail');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to update watch detail: $e');
  //   }
  // }
}
