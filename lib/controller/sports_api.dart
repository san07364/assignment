import 'package:flutter_assignment/models/sports_model.dart';
import 'package:http/http.dart' as http;

class SportsApi {
  List<SportsModel> sportsModel = [];

  Future<List<SportsModel>> getData() async {
    var client = http.Client();

    try {
      var response = await client.get(
          "http://playonnuat-env.eba-ernpdw3w.ap-south-1.elasticbeanstalk.com/api/v1/establishment/test/list?offset=0&limit=10");
      String jsonString = response.body;
      sportsModel = sportsModelFromJson(jsonString);
    } catch (e) {
      print(e);
    }
    return sportsModel;
  }
}
