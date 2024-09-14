import 'package:dio/dio.dart';
import 'package:weathery/Networking/dio_config.dart';
import 'package:weathery/models/weather_model.dart';

class ApiServices {
  ApiServices._();

  static ApiServices api = ApiServices._();

  Future<WeatherModel?> fetchData(String city) async {
    String endpoint = "q=$city&days=5&aqi=yes&alerts=no";
    Dio dio = DioConfig.getData();
    try {
      Response response = await dio.get(endpoint);
      if (response.statusCode == 200) {
        Map<dynamic, dynamic> data = response.data;
        WeatherModel weatherdata = WeatherModel.fetchdata(data);
        return weatherdata;
      } else {
        return null;
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
