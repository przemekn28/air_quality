import 'package:air_quality/const/const.dart';
import 'package:air_quality/models/cities_model.dart';
import 'package:dio/dio.dart';

class CitiesRepository {
  List<CitiesModel> list;

  Future<CitiesModel> getData() async {
    Response response;
    Dio dio;
    try {
      dio = new Dio();
      response = await dio.get(allCitiesInfoURL);
    } catch (e) {
      return null;
    }
    list = CitiesModel.fromJson(response.data) as List<CitiesModel>;
    return null;
  }
}
