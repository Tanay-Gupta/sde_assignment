import 'package:dio/dio.dart';
import 'package:sde_assignment/data/models/all_event_model.dart';
import 'package:sde_assignment/data/repositories/api/api.dart';

class AllEventRepository {
  API api = API();
  Future<List<AllEventModel>> fetchEvents() async {
    try {
      Response response = await api.sendRequest.get("");

      // Get the JSON string from the response object.
      Map<String, dynamic> jsonString = response.data;

      // Get the list of data objects.
      List<dynamic> eventMaps = jsonString['content']['data'];

      return eventMaps
          .map((eventMaps) => AllEventModel.fromJson(eventMaps))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
